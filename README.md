# Browserino

[![Gem Version](https://badge.fury.io/rb/browserino.svg)](http://badge.fury.io/rb/browserino)
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

```ruby
require 'browserino'

agent = Browserino::parse('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A')

agent.browser_name # => 'safari'
agent.browser_version # => 7.0.3

agent.engine_name # => 'webkit'
agent.engine_version # => 537.75.14

agent.system_name # => 'macintosh'
# or optionally, the full name (guessed from OS version)
agent.system_name full: true # => ['macintosh', 'mavericks']
agent.system_version # => 6.0
agent.system_architecture # => 'x32' or 'x64' or 'unknown'
```

## Development

Currently things are actually going quite well besides the fact that I am trying to learn multiple techniques at the same time thus causing code to sometimes... well be messy at best.
What I would not want you all to do is dive in there and try to understand it (tho if you do and want in, let me know!) but I would greatly appriciate help regarding the testing of this sniffer.

The tests are dynamically produced and quite easy to write.

The __/spec/user_agents.rb__ actually contains the testcases, here you can see how they are setup and all you simply have to do is read the UA yourself and fill in the correct information for the test to run.
tests will convert all input to a string and downcase it for easier comparison (since the checks need to filter words and numbers, not types).

If I wanted to add a test case for a different browser for instance (just picking a random FF on windows that is already in the tests)

```ruby
module UserAgents
  FIREFOX = {
    mac: {},
    win: {
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1' => {
        browser_name: 'Firefox',
        browser_version: '40.1',
        engine_name: 'Gecko',
        engine_version: '40.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64'
      },
    },
    linux: {}
  }
end
```

Valid browser names are defined by __/lib/browserino/patterns.rb__ (the keys are the browser names)

#### browser_name examples
```ruby
'unknown'
'ie'
'firefox'
'chrome'
'opera'
'maxthon'
```

#### engine_name examples
```ruby
'unknown'
'gecko'
'webkit'
'trident'
```

#### system_name examples

_The main reason for not having Linux distro's / versions yet is because of the fact that there are MANY different distro's with no real structured release system (going to work on that whenever there's free time!)_

```ruby
['windows', '7'] # where the 'windows' part is the name of the OS and the '7' is the actual version release (e.g. NT 6.1)
['macintosh', 'yosemite'] # same as above but OSX has different names ofcourse.
['android', 'lollipop'] # etcetera...
['unknown', 'unknown'] # in case it isn't known or in case of Linux
```

#### system_architecture examples
```ruby
'unknown'
'x32'
'x64'
```

__The value of unknown is a default error value that will always be available to test against. If it ain't known it's unknown__

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SidOfc/browserino. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
