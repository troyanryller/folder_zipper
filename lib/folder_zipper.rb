require 'folder_zipper/version'
require 'zip'

module Zip
  class FolderZipper
    attr_reader :output_file, :input_folder

    def initialize(input_folder, output_file = nil)
      # Delete last '/' from path if it present.
      @input_folder = input_folder.sub(/\/$/, '')
      @output_file = output_file || "#{@input_folder}.zip"
    end

    def compress!(delete_input_folder: false)
      files = files_path_and_name
      Zip::File.open(output_file, 'w') do |zipfile|
        files.each { |file| zipfile.add(file[:name], file[:path]) }
      end
      FileUtils.rm_rf(input_folder) if delete_input_folder
    end

    private
    def files_path_and_name
      files_path = Dir["#{input_folder}/**/**"]
      files_path.delete(output_file)
      files_path.map do |file_path|
        {
          path: file_path,
          name: file_path.sub("#{input_folder}/", '')
        }
      end
    end
  end
end
