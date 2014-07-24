# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-git-submodule-strategy"
  gem.version       = '0.1.6'
  gem.authors       = ["Boris Gorbylev"]
  gem.email         = ["ekho@ekho.name"]
  gem.description   = %q{Git submodule support for Capistrano 3}
  gem.summary       = %q{Git submodule support for Capistrano 3}
  gem.homepage      = "http://github.com/i-ekho/capistrano-git-submodule-strategy"

  gem.files         = `git ls-files`.split($/)
  # no tests as of yet
  # gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.licenses      = ['MIT']

  gem.add_dependency 'capistrano', '~> 3.1'
end
