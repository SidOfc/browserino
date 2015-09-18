# Browserino

[![Build Status](https://travis-ci.org/SidOfc/browserino.svg?branch=master)](https://travis-ci.org/SidOfc/browserino)
[![Coverage Status](https://coveralls.io/repos/SidOfc/browserino/badge.svg?branch=master&service=github)](https://coveralls.io/github/SidOfc/browserino?branch=master)

This gem aims to provide information about the browser that your visitor is using, it's main goal is not to let you exclude any browser from partying on your website (e.g. sniffing) but to provide you with more flexibility towards designing maybe a browser-themed website or knowledge of what your visitors are using to check out your website!

## About the developer

Hey there everone, my name is Sidney Liebrand and I aim to become a contributor to various open source projects as I gain experience in working with the community.
For now All I'm going to say is that I'm not that experienced with git yet or how things go so bear with me should I make any mistake.

If anyone ofcourse desires to manage this project with me feel free to add me on skype: *sidney.liebrand*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'browserino'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install browserino

## Usage

*Currently this gem has only functionality - On my list of tasks so far:*

- Extract browser
  * name __- done__
  * version __- done__
- Extract engine
  * name __- done__
  * version __- done__
- Extract operating system
  * name __- done__
  * version __- done__
  * architecture

After installing the gem globally or in your application you'll have to `require` the gem before being able to use it.

```ruby
require 'browserino'
```

Afterwards you can simply call
```ruby
Browserino::parse('<user agent>')
```

Which will return a `Browserino::Agent` object containing all the information parsed out of the supplied user agent.
On this object there are a few method calls you can do to retrieve information.

### general
```ruby
require 'browserino'

agent = Browserino::parse('Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25')

agent.browser_name # => safari
agent.browser_version # => 6.0

agent.engine_name # => applewebkit
agent.engine_version # => 536.26

agent.system_name # => ios
agent.system_version # => 6.0
agent.system_architecture # => unknown (though it will make an attempt)
```

## Development

*Should you want to contribute to the project the instructions for it will be here when version 1 releases*

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SidOfc/browserino. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
