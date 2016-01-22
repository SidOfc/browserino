# Browserino

A UserAgent sniffer with Rails >= 3.2.0 integration

## Status

[![Gem Version](https://badge.fury.io/rb/browserino.svg)](http://badge.fury.io/rb/browserino)
[![Build Status](https://travis-ci.org/SidOfc/browserino.svg?branch=master)](https://travis-ci.org/SidOfc/browserino)
[![Coverage Status](https://coveralls.io/repos/SidOfc/browserino/badge.svg?branch=master&service=github)](https://coveralls.io/github/SidOfc/browserino?branch=master)

## Changelog

_dates are in dd-mm-yyyy format_  
_older changes can be found in the [CHANGELOG.md](/CHANGELOG.md)_

#### 22-01-2016 VERSION 2.6.0

- Fixed `to_a` method
- Fixed `to_s` method
- Removed **bot** suffixes from every bot name
  - Replaced `googlebot?` with `google?`
  - Replaced `msnbot?` with `msn?`
  - Replaced `bingbot?` with `bing?`
  - Replaced `yandexbot?` with `yandex?`
  - Replaced `exabot?` with `exa?`
- Added `platform?` method
- Added `browser?` method
- Added `social_media?` method
- Added `facebook?` and `fb?` methods
- Added `twitter?` method
- Added `linkedin?` method
- Added `instagram?` method
- Added `pinterest?` method
- Added `tumblr?` method
- Added support for the Brave browser and the `brave?` method
- Added `ff?` method

#### 20-01-2016 VERSION 2.5.4

- formatted / refactored code with rubocop
- iOS `system_name full: true` returns the version no. of iOS if found

#### 19-01-2016 VERSION 2.5.3

- Minor refactoring of code

## Installation

Add the following to your applications Gemfile:

```ruby
gem 'browserino'
```

And then execute:

```
$ bundle
```

Or install it yourself with:

```
$ gem install browserino
```

Browserino is tested with the following ruby versions

* 1.9.3
* 2.0.0
* 2.1.0
* 2.2.1
* 2.3.0

## Usage

After installing the gem globally or in your application you'll have to `require` the gem before being able to use it.

```ruby
require 'browserino'
```
Afterwards, the gem is loaded and you can proceed by calling:

```ruby
Browserino.parse '<user agent>'
```

### Rails (>= 3.2.0)

If you're using Rails (>= 3.2.0) you'll have access to an `agent` object. Browserino will initialize itself using the `request.headers['User-Agent']`


A quick example on how to get going:
```ruby
class ApplicationController < ActionController::Base
  def some_method
    render json: agent
  end
end
```

### General

the `parse` method will **always** return a `Browserino::Agent` object.

```ruby
Browserino.parse '<user agent>' # => #<Browserino::Agent:0x007f9b09b1fae8 ... >
```

### Default return values

If a property isn't available or not known to Browserino it's return value will always be `nil`, this can be tested by supplying an empty string (`''`) to `parse`:

```ruby
agent = Browserino.parse ''
agent.browser_name
# => nil
```

If a value *is* found then you'll recieve a *lowercase string* containing the information:

```ruby
agent = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) brave/0.7.7 Chrome/47.0.2526.73 Electron/0.36.2 Safari/537.36'

agent.browser_name
# => 'brave'

agent.browser_version
# => '0.7.7'

agent.engine_name
# => 'webkit'
```

Browserino also has some question methods, these will always return either `true` or `false`. The exceptions to this rule are methods that can take a name, for instance the `bot?` method:

```ruby
agent = Browserino.parse ''
agent.bot?
# => true (empty UA's count as anonymous bots)

agent.googlebot?
# => false

agent.non_supported_bot?
# => NoMethodError

agent.bot? :non_supported_bot
# => NoMethodError
```

### Functions

The samples below are all valid calls with their respective outputs, using the `agent` defined below.

```ruby
agent = Browserino.parse 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko'
```

##### Quick usage

```ruby
agent.browser_name
# => 'ie'

# always returns real version, also when IE is in compat
agent.browser_version
# => '11.0'

# to get the compat version that IE is running in
# returns real version if not in compat mode
agent.browser_version compat: true
# => '11.0'

agent.engine_name
# => 'trident'

agent.engine_version
# => '7.0'

agent.system_name
# => 'windows'

# system_name attempts to find the operating systems version name
# when full: true is used
# returning an array with either the version name or nil if not found
agent.system_name full: true
# => ['windows', '7']

agent.system_version
# => '6.1'

agent.system_architecture
# => 'x64'

# two formats possible: 'aa' or `aa-bb`
agent.locale
# => 'as'
```

##### Question methods

Browserino also provides some question methods.

```ruby
# only for Internet Explorer
agent.compat?
# => false

# returns true if browser_name or bot_name are present
agent.known?
# => true

# returns true if browser is known
agent.browser?
# => true

# returns true if specific browser
agent.browser? :ie
# => true

# returns true if specific browser and version
agent.browser? :ie, version: '11.0'

# returns true if there is a social media bot on your website
agent.social_media?
# => false

# returns true if platform is known
agent.platform?
# => true

# returns true if specific platform
agent.platform? :windows
# => true

# returns true if specific platform and version
agent.platform? :windows, version: '7'
# => true

# returns true if user agent is empty or a bot is recognized
agent.bot?
# => false

agent.x64?
# => true

agent.x32?
# => false

agent.mobile?
# => false
```

The above methods are the base questions you can ask but there are a lot more methods you can call on the `agent`. Every supported browser, operating system or bot is basically a question method so you could do this:

```ruby
agent.windows?
# => true

# based on full name
agent.windows? '7'
# => true

# NT versions also work
agent.windows? 6.1
# => true
```

##### Transformation

Browserino implements `to_a`, `to_h` and `to_s` to allow for collected data to be moved around without attaching the entire object with methods.

**to_s**

Returns a compiled string of properties based on available information.

```ruby
agent.to_s
# => 'ie ie11 trident trident7 windows x64'

# a seperator can be passed to format the name + version combo's
agent.to_s '-'
# => 'ie ie-11 trident trident-7 windows x64'
```

If the agent object can't find a property in the user agent, that property will be excluded from the string.
For instance, if the `browser_version` and `engine_version` of the `agent` object are `nil` then the following will be returned:

```ruby
agent.to_s
# => ie trident windows x64
```

**to_a**

Returns an array with key => value pairs.

```ruby
agent.to_a
# => [[:browser_name, "ie"],
#     [:browser_version, "11.0"],
#     [:engine_name, "trident"],
#     [:engine_version, "7.0"],
#     [:system_name, "windows"],
#     [:system_version, "6.1"],
#     [:system_architecture, "x64"],
#     [:locale, "as"],
#     [:bot_name, nil]]
```

**to_h**

Returns a hash with key => value pairs.

```ruby
agent.to_h
# => {:browser_name=>"ie",
#     :browser_version=>"11.0",
#     :engine_name=>"trident",
#     :engine_version=>"7.0",
#     :system_name=>"windows",
#     :system_version=>"6.1",
#     :system_architecture=>"x64",
#     :locale=>"as",
#     :bot_name=>nil}
```

##### Supplying versions

Consider this parsed string:

```ruby
agent = Browserino.parse 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SM-T210R Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30 UCBrowser/2.3.2.300'

# output for system_name
agent.system_name
# => 'android'

# output for system_name full: true
agent.system_name full: true
# => ['android', 'Jelly Bean 16']
```

When supplying a version to a method that supports it, you have multiple options for the format of that version.

* Using a symbol or string without version: `:jelly_bean` or `'jelly_bean'`
* Using a symbol or string with version: `:jelly_bean_16` or `'jelly_bean_16'`
* Using a string: `'4.1.2'`  
* Using a float: `4.1`
* Using an int: `4`

When calling the `platform?` or `android?` functions with the above examples, they would all match since the method that compares versions also checks how specific the version is that you want to compare against.

If you pass in `4.1` as a version the matcher will look for `x.x` in the extracted version and discard the unspecified value, this allows for you to be explicitly less specific to allow for a greater range of systems to be matched.

* `4.1.2` will match `4.1.2`
* `4.1` will match `4.1.x`
* `4` will match `4.x.x`

**Examples using `platform?`**

```ruby
agent.platform? :android, version: '4.1.2'
# => true

agent.platform? :android, version: 4.1
# => true

agent.platform? :android, version: 4
# => true

agent.platform? :android, version: :jelly_bean
# => true

agent.platform? :android, version: :jelly_bean_16
# => true
```

##### `platform?`, `browser?`, `bot?` and `social_media?` methods

As you've seen above, the `platform?` function can take two arguments, a symbol with the system name and optionally a hash with a `:version` key to supply a version, the `browser?` method works in exactly the same way.

The `bot?` and `social_media?` methods however aren't that complex since you don't need to know a bot / social media version or anything other than it's name so inside these methods, only a name can be passed:

*Every social media match is automatically a bot, but a bot isn't automatically social media*

```ruby
# when a bot UA gets parsed
agent = Browserino.parse 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)'

agent.bot?
# => true

agent.social_media?
# => true

agent.bot? :facebook
# => true

agent.social_media? :facebook
# => true

agent.bot? :facebook, version: 1.1
# => ArgumentError
```

##### Checking a specific browser, system, bot or social media

Every name you see in the below lists can be passed as symbol or string to their respective method

**social media**

* `facebook` or `fb`
* `twitter`
* `linkedin`
* `instagram`
* `pinterest`
* `tumblr`

Examples:

```ruby
agent.facebook?
agent.tumblr?

# using the social_media? method
agent.social_media? :facebook

# using shorthand
agent.social_media? :fb

agent.social_media? :tumblr
```

**bot**

* `google`
* `msn`
* `bing`
* `yahoo_slurp`
* `baiduspider`
* `yandex`
* `sosospider`
* `exa`
* `sogou_spider`

Examples:

```ruby
agent.google?
agent.exa?

# using the bot? method
agent.bot? :google
agent.bot? :exa
```

**browser**

* `chrome`
* `firefox` or `ff`
* `seamonkey`
* `opera`
* `opera_mini`
* `vivaldi`
* `ucbrowser`
* `maxthon`
* `bolt`
* `brave`
* `safari`
* `ie`
* `edge`

Examples:

```ruby
agent.firefox?
agent.chrome? 42

# using the browser? method
agent.browser? :firefox

# using shorthand
agent.browser? :ff

agent.browser? :chrome, version: 42
```

**operating system**

* `windows` or `win`
* `macintosh` or `osx`
* `linux`
* `bsd`
* `android`
* `ios`
* `blackberry` or `bb`
* `windows_phone`

Examples:

```ruby
agent.macintosh?
agent.windows_phone? 7

# to check for windows vista one could do
agent.windows? 6

# a more readable equivelant
agent.windows? :vista

# using the platform? method
agent.platform? :macintosh

# using shorthand
agent.platform? :osx

agent.platform? :windows_phone, version: 7
```

Notes:

* `linux?` doesn't support any versions
* `bsd?` doesn't support any versions
* *named versions* are only supported if they are present in a [map](/lib/browserino/maps)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SidOfc/browserino. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
