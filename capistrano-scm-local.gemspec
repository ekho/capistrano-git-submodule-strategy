# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-scm-local"
  gem.version       = '0.1.0'
  gem.authors       = ["Boris Gorbylev"]
  gem.email         = ["ekho@ekho.name"]
  gem.description   = %q{Capistrano extension for deploying form local directory}
  gem.summary       = %q{Capistrano SCM Local - Deploy from local copy}
  gem.homepage      = "http://github.com/i-ekho/capistrano-scm-local"

  gem.files         = `git ls-files`.split($/)
  # no tests as of yet
  # gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.licenses      = ['MIT']

  gem.add_dependency 'capistrano', '~> 3.1'
  gem.add_dependency 'minitar', '~> 0.5.4'
end
