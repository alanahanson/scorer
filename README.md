# Scorer

This gem helps users integrate with a hypothetical API, which provides consumer scoring advice based on income, age, and ZIP code.

## Dependencies

Before using, install ruby 2.3.0 and Bundler ~>1.11

## Installation

Clone this repo to your machine:
```
$ git clone https://github.com/alanahanson/scorer.git
```
Navigate into the repo:
```
$ cd scorer
```
And enter:

```
$ gem build SCORER.gemspec
$ gem install scorer-0.1.0.gem
```

Then execute:
```
$ bundle
```

## Usage

Start out by adding this line to your Ruby file:

```ruby
require 'scorer'
```

This module has one method - `get_score`. This method takes between 1 and 3 arguments (income, age, and ZIP code) in a hash and returns a Score (an object) with 'propensity' and 'ranking' methods.

Example:

```ruby
require 'scorer'

Scorer.get_score(age: 42, income: 53000, zipcode: '42042')

=> #<Scorer::Score:0x007ffd50a137b8 @propensity=86, @ranking="B">

```

The age, income, and ZIP code arguments are optional, but you must provide at least one. Age has to be a positive integer. Income has to be a positive number (integer or float). ZIP code has to be a string of either 5 or 9 digits.

## Testing

To run test suite, enter: 

```
rake spec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alanahanson/scorer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

