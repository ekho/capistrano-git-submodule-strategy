# capistrano-git-submodule-strategy [![Gem](https://img.shields.io/gem/v/capistrano-git-submodule-strategy.svg?maxAge=2592000)](https://rubygems.org/gems/capistrano-git-submodule-strategy) [![Gem](https://img.shields.io/gem/dt/capistrano-git-submodule-strategy.svg?maxAge=2592000)](https://rubygems.org/gems/capistrano-git-submodule-strategy)

Git submodule support for Capistrano 3.0-3.6.*

For Capistrano 3.7+ use new [capistrano-git-with-submodules](https://github.com/ekho/capistrano-git-with-submodules)

*Project is not in an active development and support.*


## Using

####Capfile
```ruby
require 'capistrano/git-submodule-strategy'
```

####Gemfile
```ruby
gem 'capistrano-git-submodule-strategy', '~> 0.1', :github => 'ekho/capistrano-git-submodule-strategy'
```

####deploy.rb
```ruby
set :scm, :git
set :git_strategy, Capistrano::Git::SubmoduleStrategy
```
Optionally you can keep git metadata (.git directory)
```ruby
set :git_keep_meta, true
```

## Contributing to capistrano-git-submodule-strategy
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Boris Gorbylev. See LICENSE for further details.
