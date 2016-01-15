# Browserino

[![Gem Version](https://badge.fury.io/rb/browserino.svg)](http://badge.fury.io/rb/browserino)
[![Build Status](https://travis-ci.org/SidOfc/browserino.svg?branch=master)](https://travis-ci.org/SidOfc/browserino)
[![Coverage Status](https://coveralls.io/repos/SidOfc/browserino/badge.svg?branch=master&service=github)](https://coveralls.io/github/SidOfc/browserino?branch=master)

This gem aims to provide information about the browser that your visitor is using, it's main goal is not to let you exclude any browser from partying on your website (e.g. sniffing) but to provide you with more flexibility towards designing maybe a browser-themed website or knowledge of what your visitors are using to check out your website!

## Changelog
_dates are in dd-mm-yyyy format_  
_older changes can be found in the [CHANGELOG.md](https://github.com/SidOfc/browserino/blob/master/CHANGELOG.md)_

#### 15-01-2016 VERSION 2.5.2

- **DEPRECATE** Custom return values (passed through `Browserino::parse`) will no longer alter the output of the agent object
- Added support for windows phone detection
- Added `windows_phone?` method

#### 12-01-2016 VERSION 2.5.1

- Patched blackberry mapping, this used to be done by model number instead but is now corrected

#### 12-01-2016 VERSION 2.5.0

- Added support for the Vivaldi browser
- New method `#vivaldi?`
- Added support for the bsd family of operating systems
- New method `#bsd?`
- Fixed using symbols for system version identification (e.g. `:vista` or `:el_capitan`) without a version number

## Installation

*supports ruby 1.9.3+*  
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

Or if you're using Rails *(>= 3.2.0)*, in your controllers you'll have access to an `agent` object

```ruby
class HomeController < ApplicationController
  def index
    render json: agent
  end
end
```

The return value will always be `nil` if a value isn't found

`Browserino::parse()` will return a `Browserino::Agent` object containing all the information parsed out of the supplied user agent.
On this object there are a few method calls you can do to retrieve information.

```ruby
require 'browserino'

agent = Browserino::parse('user-agent')

agent.browser_name
# => 'safari'

# always returns the real version (also with IE in compat)
agent.browser_version
# => '7.0.3'

# if a user is running IE in compat mode this will return the compat version
agent.browser_version compat: true
# => '7.0'

agent.engine_name
# => 'webkit'

agent.engine_version
# => '537.75.14'

agent.system_name
# => 'macintosh'
# possibilities are macintosh, windows, blackberry, android, linux, bsd and ios

# or optionally, the full name (guessed from OS version)
agent.system_name full: true
# => ['macintosh', 'mavericks']

agent.system_version
# => '10.9.3'

agent.system_architecture
# => 'x32'

# or through convenience methods:
agent.x32?
# => true

agent.x64?
# => false

# get the locale, either 'aa' or 'aa-bb' format
agent.locale
# => 'en'
# or if the UA supplies the information
# => 'en-us'


# name of bot if the UA was identified as bot
agent.bot_name
# => 'googlebot'

# returns true if the agent is a bot
agent.bot?
# => true

# returns true if the agent is the specified bot
agent.bot? :googlebot
# => true

# check IE compatibility mode
agent.compat?
# => true

# true if browser_name or bot_name present
agent.known?
# => true

# true if agent is a mobile device
agent.mobile?
# => true

# methods to convert object into a String, Array or hash
agent.to_s
# => 'safari safari7 webkit webkit537 macintosh macintosh10 en-us'

# to_s can split version numbers from words if a seperator is supplied
agent.to_s '-'
# => 'safari safari-7 webkit webkit-537 macintosh macintosh-10 en-us'

agent.to_a
# => [
#      [:browser_name, 'safari'],
#      [:browser_version, '7.0.3'],
#      [:engine_name, 'webkit'],
#      [:engine_version, '537.75.14'],
#      [:system_name, 'macintosh'],
#      [:system_version, '10'],
#      [:system_architecture, nil],
#      [:locale, nil],
#      [:bot_name, nil]
#    ]

agent.to_h
# => {
#      browser_name: 'safari',
#      browser_version: '7.0.3',
#      engine_name: 'webkit',
#      engine_version: '537.75.14',
#      system_name: 'macintosh',
#      system_version: '10',
#      system_architecture: nil,
#      locale: nil,
#      bot_name: nil
#    }
```

It is now also possible to call methods to determine a specific OS or browser if it's supported, a `noMethodError` will be thrown otherwise
The function uses the names of the `Browserino::Mapping` constants and the `Browserino::PATTERNS` hashes `:browser` and `:bot` output to identify wether or not to throw this exception.
Versions are also supported as an argument to the function, for operating systems versions could include a string, symbol or float / integer to indicate a version.
_(examples given for windows, android and ios, for a full list of versions check the **maps** folder)_
Browsers can also accept a float / integer to check for a specific version.

### DEPRECATION NOTICE

**Methods that include a version number in their name (`agent.android4?`) are deprecated as of version 2.0.0. Supply the version as argument instead `agent.android?(4)` or `agent.android('Ice Cream Sandwich')`**

##### Supported systems

```ruby
agent.android?

# check for android jellybean
# agent.android?(:jellybean) or agent.android?('jellybean') or agent.android?(4.1)

agent.ios?

# check version of iOS (>= 1.0.0)
# agent.ios9?

# check version of iOS (>= 2.0.0)
# agent.ios?(9)

agent.windows?

# check for windows Vista (>= 1.0.0)
# agent.windows60?

# check for windows Vista (>= 2.0.0)
# agent.windows?(6) - based on NT version
# agent.windows?(6.0) - based on NT version
# agent.windows?(:vista) or agent.windows?('vista')

agent.macintosh?

agent.blackberry?

agent.windows_phone?

agent.linux? # linux doesn't have versions

agent.bsd? # bsd also doesn't have versions
```

You could also invert these questions by using the `.not` method

```ruby
agent.not.android?

# check for android jellybean
# agent.not.android?(:jelly_bean) or agent.not.android?('jelly bean') or agent.not.android?(4.1)

agent.not.ios?

# check if iOS version isn't 9 (>= 1.4.0)
# agent.not.ios9?

# check if iOS version isn't 9 (>= 2.0.0)
# agent.not.ios?(9)

agent.not.windows?

# check if not windows vista (>= 1.4.0)
# agent.not.windows60?

# check if not windows vista (v2.x.x)
# agent.not.windows?(6) - based on NT version
# agent.not.windows?(6.0) - based on NT version
# agent.not.windows?(:vista) or agent.not.windows?('vista')

agent.not.macintosh?

agent.not.blackberry?

agent.not.windows_phone?

agent.not.linux?

agent.not.bsd?
```

The `#windows?`, `#macintosh?` and `#blackberry?` each have a shortcut method to allow for easier access, `#win?`, `#osx?`, `#bb?`

##### Supported browsers  

```ruby
agent.vivaldi?

agent.opera?

agent.opera_mini?

agent.bolt?

agent.ucbrowser?

agent.maxthon?

agent.edge?

agent.ie?

agent.firefox?

agent.chrome?

agent.seamonkey?

agent.safari?

# or with the .not method (>= 1.4.0)
agent.not.vivaldi?

agent.not.opera?

agent.not.maxthon?

# etc etc...
```

##### Supported bots
```ruby
agent.msnbot?

agent.yahoo_slurp?

agent.googlebot?

agent.bingbot?

agent.baiduspider?

agent.yandexbot?

agent.sosospider?

agent.exabot?

agent.sogou_spider?

# or with the .not method (>= v1.4.0)

agent.not.msnbot?

agent.not.yahoo_slurp?

# etc etc...
```

## Development

The tests are dynamically produced and quite easy to write.

The __/spec/user_agents_browsers.rb__ and __/spec/user_agents_bots.rb__ actually contain the test cases for both browsers and bots respectively, here you can see how they are setup and all you simply have to do is read the UA yourself and fill in the correct information for the test to run.
the tests will lowercase most of the input to make sure there's no case mismatches, this happens mainly on the `*_name` properties

If I wanted to add a test case for a different browser for instance (just picking a random FF on windows that is already in the tests)

```ruby
module UserAgents
  module Browsers
    FIREFOX = {
      win: {
        'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1' => {
          browser_name: 'Firefox',
          browser_version: '40.1',
          engine_name: 'Gecko',
          engine_version: '40.0',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: 'x64',
          locale: nil,
          x64?: true,
          x32?: false,
          known?: true,
          mobile: false
        }
      }
    }
  end
end
```

Valid browser names are defined by __/lib/browserino/patterns.rb__ (the keys are the browser names)

#### browser_name examples
```ruby
'ie'

`edge`

'firefox'

'chrome'

`vivaldi`

'opera'

'opera_mini'

'bolt'

'ucbrowser'

'seamonkey'

'maxthon'
```

#### engine_name examples
```ruby

'gecko'

'webkit'

'trident'
```

#### bot_name examples
```ruby
'googlebot'

'yahoo_slurp'

'msnbot'

'bingbot'

'baiduspider'

'yandexbot'

'sosospider'

'exabot'

'sogou_spider'
```

#### system_name examples

```ruby
'windows'

'win'

'macintosh'

'osx'

'blackberry'

'bb'

'windows_phone'

'android'

'ios'

'linux'

`bsd`
```

#### system_architecture examples
```ruby
'x32'

'x64'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SidOfc/browserino. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
