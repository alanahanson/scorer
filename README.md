# Scorer

This gem helps users integrate with a hypothetical API, which provides consumer scoring advice based on income, age, and ZIP code.

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



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/scorer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

