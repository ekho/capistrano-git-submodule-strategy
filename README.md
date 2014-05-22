capistrano-git-submodule-strategy
=================================

Git submodule support for Capistrano 3

[![Gem Version](https://badge.fury.io/rb/capistrano-git-submodule-strategy.svg)](http://badge.fury.io/rb/capistrano-git-submodule-strategy)

Capfile
```ruby
require 'capistrano/git-submodule-strategy'
```

Gemfile
```ruby
gem 'capistrano-git-submodule-strategy', '~> 0.1', :github => 'i-ekho/capistrano-git-submodule-strategy'
```

deploy.rb
```ruby
set :scm, :git
set :git_strategy, Capistrano::Git::SubmoduleStrategy
```
