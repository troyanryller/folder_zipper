# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'folder_zipper/version'

Gem::Specification.new do |spec|
  spec.name          = "folder_zipper"
  spec.version       = FolderZipper::VERSION
  spec.authors       = ["Igor Petrukh"]
  spec.email         = ["pro100igor@gmail.com"]
  spec.summary       = "Zipping folder(works with nested folders) to one zip file."
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "rubyzip", "~> 1.0.0"
end
