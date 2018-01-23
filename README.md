# mina-shoryuken

[Shoryuken](https://github.com/phstc/shoryuken) tasks for [Mina](https://github.com/mina-deploy/mina) deployments.
Inspired by [mina-sidekiq](https://github.com/Mic92/mina-sidekiq).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-shoryuken'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-shoryuken

## Usage

```ruby
require 'mina_shoryuken/tasks'
#...

task :setup do
  # shoryuken needs a place to store its pid file and log file
  command %(mkdir -p "#{fetch(:deploy_to)}/shared/pids/")
  command %(mkdir -p "#{fetch(:deploy_to)}/shared/log/")
end

task :deploy do
  deploy do
    # stop accepting new workers
    invoke :'git:clone'
    invoke :'shoryuken:quiet'
    invoke :'deploy:link_shared_paths'
    ...

    on :launch do
      ...
      invoke :'shoryuken:restart'
    end
  end
end
```

## Available Tasks

* shoryuken:stop
* shoryuken:start
* shoryuken:restart
* shoryuken:quiet


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/beaorn/mina-shoryuken.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
