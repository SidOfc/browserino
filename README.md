# Browserino

[![Gem Version](https://badge.fury.io/rb/browserino.svg)](http://badge.fury.io/rb/browserino)
[![Build Status](https://travis-ci.org/SidOfc/browserino.svg?branch=master)](https://travis-ci.org/SidOfc/browserino)
[![Coverage Status](https://coveralls.io/repos/SidOfc/browserino/badge.svg?branch=master&service=github)](https://coveralls.io/github/SidOfc/browserino?branch=master)

This gem aims to provide information about the browser that your visitor is using, it's main goal is not to let you exclude any browser from partying on your website (e.g. sniffing) but to provide you with more flexibility towards designing maybe a browser-themed website or knowledge of what your visitors are using to check out your website!

## Changelog
_dates are in dd-mm-yyyy format_  
_older changes can be found in the [CHANGELOG.md](https://github.com/SidOfc/browserino/blob/master/CHANGELOG.md)_

#### 03-01-2016 VERSION 1.6.0

- Added more tests
- Added more browsers to check: *(bolt, opera mini and ucbrowser)*
- Added `#known?` method to check if the agent is known
- Added a `#ua` method to return the User Agent string as given to `Browserino::parse()`
- Added `#x64?` and `#x32?` convenience methods to check system architecture
- Added `#mobile?` to check wether or not a user agent is mobile
- Moved older changelogs to its own [CHANGELOG.md](https://github.com/SidOfc/browserino/blob/master/CHANGELOG.md) file
- Changed `#to_s` to add dashes (`-`) between browser names if they have a space
- `#to_s` now has an optional (`sep = ''`) parameter that allows info and version numbers to be seperated

#### 31-12-2015 VERSION 1.5.3

- Added blackberry support
- Added tests for blackberry user agent strings

#### 31-12-2015 VERSION 1.5.2

- Added user agents
- Patterns could falsely identify a 64bit system, made the pattern more strict
- using `X11` in a user agent as a synonym to a `#linux?` system

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
agent.system_version # => 10.9.3
agent.system_architecture # => 'x32' or 'x64' if known
# or through convenience methods:
agent.x32? # => true for 32bit UA's
agent.x64? # => true for 64bit UA's

agent.known? # => true if browser_name present
agent.mobile? # => true if agent is a mobile device

# methods to convert object into a String, Array or hash
agent.to_s # => 'safari safari7 webkit webkit537 macintosh macintosh10'
# to_s can split version numbers from words if a seperator is supplied
agent.to_s '-' # => 'safari safari-7 webkit webkit-537 macintosh macintosh-10'

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
agent.blackberry?
agent.linux?
```

You could also invert these questions by using the `.not` method


```ruby
agent.not.android?
agent.not.ios?
agent.not.windows?
agent.not.macintosh?
agent.not.blackberry?
agent.not.linux?
```

Supported browsers  

```ruby
agent.opera?
agent.opera_mini?
agent.bolt?
agent.ucbrowser?
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

Since linux doesn't have any supported versions all you can pretty much do is check if `agent.linux?` is true if you want to check for linux systems. Also - `X11` in a user agent string will now also cause the OS to be set to linux. The others do have versions so if you wanted to check for windows 10 you could do:

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
    win: {
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1' => {
        browser_name: 'Firefox',
        browser_version: '40.1',
        engine_name: 'Gecko',
        engine_version: '40.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        known?: true,
        mobile: false
      }
    }
  }
end
```

Valid browser names are defined by __/lib/browserino/patterns.rb__ (the keys are the browser names)

#### browser_name examples
```ruby
'ie'
'firefox'
'chrome'
'opera'
'opera_mini'
'bolt'
'ucbrowser'
'maxthon'
```

#### engine_name examples
```ruby
'gecko'
'webkit'
'trident'
```

#### system_name examples

_The main reason for not having Linux distro's / versions is because of the fact that there are MANY different distro's with no real structured release system. The best I can do here is allow a `linux?` system to be found atleast_

```ruby
['windows', '7'] # where the 'windows' part is the name of the OS and the '7' is the actual version release (e.g. NT 6.1)
['macintosh', 'yosemite'] # same as above but OSX has different names ofcourse.
['android', 'lollipop 22'] # etcetera...
['linux', nil] # in every linux case, the version will be missing on system_name full: true
[nil, nil] # when nothing about the agent could be found
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
