capistrano-scm-local
====================

allow deploy from local directory

Capfile
```ruby
require 'capistrano/scm-local'
```

Gemfile
```ruby
gem 'capistrano-scm-local', '~> 0.1', :github => 'i-ekho/capistrano-scm-local'
```

deploy.rb
```ruby
set :scm, :local
set :local_strategy, :archive
set :repo_url, 'path/to/source'
```

local_strategy can be :default or :archive
:default - directly uploads folder
:archive - makes tar.gz, uploads it and unpack
