# Browserino

[![Gem Version](https://badge.fury.io/rb/browserino.svg)](http://badge.fury.io/rb/browserino)
[![Build Status](https://travis-ci.org/SidOfc/browserino.svg?branch=master)](https://travis-ci.org/SidOfc/browserino)
[![Coverage Status](https://coveralls.io/repos/SidOfc/browserino/badge.svg?branch=master&service=github)](https://coveralls.io/github/SidOfc/browserino?branch=master)

This gem aims to provide information about the browser that your visitor is using, it's main goal is not to let you exclude any browser from partying on your website (e.g. sniffing) but to provide you with more flexibility towards designing maybe a browser-themed website or knowledge of what your visitors are using to check out your website!

## Changelog
_dates are in dd-mm-yyyy format_

#### 23-12-2015 VERSION 1.5.1.1

- Removed print statements from method

#### 20-12-2015 VERSION 1.5.1

- Fixed `respond_to?` method which would first return inverted results (e.g. false when it should be true)

#### 19-12-2015 VERSION 1.5.0

- Implemented to_s to return a concatenated string of property values
- Implemented to_a to return an array with arrays containing property name-value pairs
- Implemented to_h to return a hash containing property name-value pairs
- Removed unused code

#### 19-12-2015 VERSION 1.4.0

- Added not method to invert questions about browser / system
- Added random test cases to verify that all inverted answers are correct

#### 17-12-2015 VERSION 1.3.0

- Added Edge detection
- For supported browsers, it is now possible to check name and version through `method_missing?`

#### 16-12-2015 VERSION 1.2.0

- Opera tests didn't run before
- For supported systems, it is possible to check OS and version through `method_missing?`

#### 15-12-2015 VERSION 1.1.2

- User definable 'unknown' return value

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
Optionally if you're using a version _>=_ than _1.1.2_ you can set a return value in place of `nil` when running `::parse(...)`.
If you want any unknown properties to return the string `unknown` you could do so like this:

```ruby
Browserino::parse('<user agent>', 'unknown')
```

Without specifying the second argument the value for unknown properties will always be `nil`

`Browserino::parse()` will return a `Browserino::Agent` object containing all the information parsed out of the supplied user agent.
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

# methods to convert object into a String, Array or hash
agent.to_s # => 'safari safari7 webkit webkit537 macintosh macintosh10'
agent.to_a # => [
#                 [:browser_name, 'safari'],
#                 [:browser_version, '7.0.3'],
#                 [:engine_name, 'webkit'],
#                 [:engine_version, '537.75.14'],
#                 [:system_name, 'macintosh'],
#                 [:system_version, '10'],
#                 [:system_architecture, nil]
#               ]
agent.to_h # => {
#                 browser_name: 'safari',
#                 browser_version: '7.0.3',
#                 engine_name: 'webkit',
#                 engine_version: '537.75.14',
#                 system_name: 'macintosh',
#                 system_version: '10',
#                 system_architecture: nil
#               }
```

It is now also possible to call methods to determine a specific OS or browser if it's supported, a `noMethodError` will be thrown otherwise
The function uses the names of the `Browserino::Mapping.constants(true)` or `Browserino::PATTERNS[:browser].keys` output to identify wether or not to throw this exception.

Supported systems

```ruby
agent.android?
agent.ios?
agent.windows?
agent.macintosh?
agent.linux?
```

You could also invert these questions by using the `.not` method


```ruby
agent.not.android?
agent.not.ios?
agent.not.windows?
agent.not.macintosh?
agent.not.linux?
```

Supported browsers  

```ruby
agent.opera?
agent.maxthon?
agent.edge?
agent.ie?
agent.firefox?
agent.chrome?
agent.safari?

# or with the .not method

agent.not.opera?
agent.not.maxthon?

# etc etc...

```

Since linux doesn't have any supported versions all you can pretty much do is check if `agent.linux?` is true if you want to check for linux systems. The others do have versions so if you wanted to check for windows 10 you could do:

```ruby
agent.windows10?
```

**note** Windows versions use their respective *NT* versioning so `agent.windows6?` equals `Vista` - I have yet to make changes to fix that. Browser versions use their actual version which always matches up with their real version, the same goes for the other systems.

## Development

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

_The main reason for not having Linux distro's / versions <strike>yet</strike> is because of the fact that there are MANY different distro's with no real structured release system. <strike>(going to work on that whenever there's free time!)</strike>_

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
