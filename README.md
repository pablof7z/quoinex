# quoinex

[![Gem](https://img.shields.io/gem/v/quoinex.svg)](https://rubygems.org/gems/quoinex)
[![GitHub license](https://img.shields.io/github/license/heelhook/quoinex.svg)](./LICENSE.txt)
[![Gemnasium](https://img.shields.io/gemnasium/heelhook/quoinex.svg)](https://gemnasium.com/heelhook/quoinex)
[![Travis](https://img.shields.io/travis/heelhook/quoinex.svg)](https://travis-ci.org/heelhook/quoinex)
[![Codecov](https://img.shields.io/codecov/c/github/heelhook/quoinex.svg)](https://codecov.io/github/heelhook/quoinex)
[![Code Climate](https://img.shields.io/codeclimate/github/heelhook/quoinex.svg)](https://codeclimate.com/github/heelhook/quoinex)

> Built from [makenew/ruby-gem](https://github.com/makenew/ruby-gem).n
## Description


## Installation

Add this line to your application's [Gemfile][Bundler]

```ruby
gem 'quoinex'
```

and update your bundle with

```
$ bundle
```

Or install it yourself with

```
$ gem install quoinex
```

[Bundler]: http://bundler.io/

## Usage

```
client = Quoinex::API.new(passphrase: ..., key: ..., secret: ...)
```

### Fetching accounts

```
client.accounts
```

### Listing orders

```
client.orders
```

### Order detils

```
client.order(id)
```

### Placing an order

```
client.create_order(
  side: :buy,
  size: 1.0,
  price: 10000,
  product_id: 'BTCEUR',
  type: 'limit',
)
```

### Cancel an order

```
client.cancel_order(id)
```

## Documentation

- [YARD documentation][RubyDoc] is hosted by RubyDoc.info.
- [Interactive documentation][Omniref] is hosted by Omniref.

[RubyDoc]: http://www.rubydoc.info/gems/quoinex
[Omniref]: https://www.omniref.com/ruby/gems/quoinex

## Development and Testing

### Source Code

The [quoinex source] is hosted on GitHub.
Clone the project with

```
$ git clone https://github.com/heelhook/quoinex.git
```

[quoinex source]: https://github.com/heelhook/quoinex

### Requirements

You will need [Ruby] with [Bundler].

Install the development dependencies with

```
$ bundle
```

[Bundler]: http://bundler.io/
[Ruby]: https://www.ruby-lang.org/

### Rake

Run `$ rake -T` to see all Rake tasks.

```
rake build                 # Build quoinex-2.0.1.gem into the pkg directory
rake bump:current[tag]     # Show current gem version
rake bump:major[tag]       # Bump major part of gem version
rake bump:minor[tag]       # Bump minor part of gem version
rake bump:patch[tag]       # Bump patch part of gem version
rake bump:pre[tag]         # Bump pre part of gem version
rake bump:set              # Sets the version number using the VERSION environment variable
rake clean                 # Remove any temporary products
rake clobber               # Remove any generated files
rake install               # Build and install quoinex-2.0.1.gem into system gems
rake install:local         # Build and install quoinex-2.0.1.gem into system gems without network access
rake release[remote]       # Create tag v2.0.1 and build and push quoinex-2.0.1.gem to Rubygems
rake rubocop               # Run RuboCop
rake rubocop:auto_correct  # Auto-correct RuboCop offenses
rake spec                  # Run RSpec code examples
rake test                  # Run test suite
rake yard                  # Generate YARD Documentation
```

### Guard

Guard tasks have been separated into the following groups:
`doc`, `lint`, and `unit`.
By default, `$ guard` will generate documentation, lint, and run unit tests.

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/heelhook/quoinex/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes. Write and run tests.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

This Ruby gem is licensed under the MIT license.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
