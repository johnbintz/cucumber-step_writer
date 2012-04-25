# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["John Bintz"]
  gem.email         = ["john@coswellproductions.com"]
  gem.description   = %q{Write out step files for undefined Cucumber steps.}
  gem.summary       = %q{Write out step files for undefined Cucumber steps.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cucumber-step_writer"
  gem.require_paths = ["lib"]
  gem.version       = "0.1.2"
end

