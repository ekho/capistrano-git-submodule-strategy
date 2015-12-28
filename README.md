# capistrano-git-submodule-strategy

Git submodule support for Capistrano 3 [![Gem Version](https://badge.fury.io/rb/capistrano-git-submodule-strategy.svg)](http://badge.fury.io/rb/capistrano-git-submodule-strategy)

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
set ::git_keep_meta, true
```

## Contributing to capistrano-git-submodule-strategy
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2014 Boris Gorbylev. See LICENSE for further details.
