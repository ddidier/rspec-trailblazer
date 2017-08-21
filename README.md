# Rspec::Trailblazer

<!--
[![Build Status](https://secure.travis-ci.org/trailblazer/rspec-trailblazer.png)](http://travis-ci.org/trailblazer/rspec-trailblazer)
[![Dependency Status](https://gemnasium.com/trailblazer/rspec-trailblazer.png)](https://gemnasium.com/trailblazer/rspec-trailblazer)
[![Code Climate](https://codeclimate.com/github/trailblazer/rspec-trailblazer/badges/gpa.svg)](https://codeclimate.com/github/trailblazer/rspec-trailblazer)
[![Test Coverage](https://codeclimate.com/github/trailblazer/rspec-trailblazer/badges/coverage.svg)](https://codeclimate.com/github/trailblazer/rspec-trailblazer/coverage)
[![Yard Documentation](http://img.shields.io/badge/yard-docs-blue.svg)](http://www.rubydoc.info/github/trailblazer/rspec-trailblazer)
[![Documentation Coverage](https://inch-ci.org/github/trailblazer/rspec-trailblazer.svg)](https://inch-ci.org/github/trailblazer/rspec-trailblazer)
-->

RSpec Matchers for Trailblazer

<!--
The API documentation can be find at [RubyDoc](http://www.rubydoc.info/github/trailblazer/rspec-trailblazer).
-->



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-trailblazer'
```

And then execute `bundle`

Or install it yourself with `gem install rspec-trailblazer`



## Usage

### Prerequisites

This gem requires:

- `trailblazer >= 2.0`
- `rspec >= 3.0`

And is tested with:

- `Ruby 2.4`
- `Ruby 2.3`
- `Ruby 2.2`

### Operation matchers

- `be_failed`: ensure that a Trailblazer operation has failed <!--([documentation](http://www.rubydoc.info/gems/rspec-trailblazer/RSpec%2FTrailblazer%2FMatchers%2FOperations:be_failed))-->;
- `be_successful`: ensure that a Trailblazer operation was successful <!--([documentation](http://www.rubydoc.info/gems/rspec-trailblazer/RSpec%2FTrailblazer%2FMatchers%2FOperations:be_successful))-->;



## Development

### Prerequisites

In order to extensively test this library with all the supported versions of Ruby and RSpec, you will need to manage:

- several Ruby environments using [RVM](https://rvm.io/)
- several gems sets using [Appraisal](https://github.com/thoughtbot/appraisal)
- several test execution environments (Ruby and gems) using [WWTD](https://github.com/grosser/wwtd)

### Setup

After installing RVM, check out the repository and run `bin/setup` to setup all the environments. This script will:

- create the latest Ruby environment with RVM and an associated gems set using the `.ruby-version`
and `.ruby-gemset` files:

```bash
rvm use
gem install bundler --no-rdoc --no-ri
bundle install
```

- install all the required Ruby versions listed in `.travis.yml`. For example:

```bash
export LOCAL_RUBY_VERSION=2.2.7 \
 && rvm install ruby-$LOCAL_RUBY_VERSION \
 && rvm use ruby-$LOCAL_RUBY_VERSION \
 && gem install bundler --no-rdoc --no-ri
export LOCAL_RUBY_VERSION=2.3.4 \
 && rvm install ruby-$LOCAL_RUBY_VERSION \
 && rvm use ruby-$LOCAL_RUBY_VERSION \
 && gem install bundler --no-rdoc --no-ri
export LOCAL_RUBY_VERSION=2.4.1 \
 && rvm install ruby-$LOCAL_RUBY_VERSION \
 && rvm use ruby-$LOCAL_RUBY_VERSION \
 && gem install bundler --no-rdoc --no-ri
```

- create a `Gemfile.lock` for each set of the dependencies:

```bash
appraisal install
```

- install all the dependencies in their associated environment:

```bash
wwtd --only-bundle
```

At last, to test this library in all the supported environments, just run:

```bash
wwtd --parallel
```

### Release

As a reminder...

- update the changelog
- update the library version
- update all dependencies in all the environments:

```bash
bundle update
appraisal update
wwtd --only-bundle
```

- run the tests in all the environments with `wwtd --parallel`
- release with `bundle exec rake release`



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/trailblazer/rspec-trailblazer. This project
is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.



## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
