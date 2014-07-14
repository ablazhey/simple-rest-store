# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'StudyTube/version'

Gem::Specification.new do |spec|
  spec.name          = "StudyTube"
  spec.version       = StudyTube::VERSION
  spec.authors       = ["Andrey"]
  spec.email         = ["andrey.blahey@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: 
                            Initalize:

                               @foo = StudyTube::StudyTube.new(TYPE, FILE_PATH)
                                
                                  TYPE takes values 'REST' or 'FILES' or 'RestFiles'
                                  FILE_PATH takes values 'file.txt'

                              @foo.create(key, value) - create rows 

                              @foo.update(key, value) - update rows

                              @foo.delete(key)  - delete rows

                              @foo.show(key)

                              @foo.list

                                key - String
                                value - String                  
               
                          }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
