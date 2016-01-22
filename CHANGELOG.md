## CHANGELOG
_dates are in dd-mm-yyyy format_

#### 15-01-2016 VERSION 2.5.2

- **DEPRECATE** Custom return values (passed through `Browserino.parse`) will no longer alter the output of the agent object
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

#### 11-01-2016 VERSION 2.4.1(.1)

- Caching the agent object in Rails
- **DEPRECATE** Using a custom return value for when a property isn't found

#### 10-01-2016 VERSION 2.4.0

- Added rails integration

#### 06-01-2016 VERSION 2.3.0

- Added `#compat?` method to test if IE is in compatibility mode
- Extended `#browser_version` to now also take an argument
- Added `#locale` method
- Empty UA's are identified as bots through `#bot?`

#### 04-01-2016 VERSION 2.2.0

- Added more bots
- `#bot?` method can now take a bot name as argument to check for an exact bot

#### 04-01-2016 VERSION 2.1.0

- Small restructuring of test suite
- Added bot detection
- Added `#bot?` method
- Added dynamic method support for bots
- Added support for the seamonkey browser

#### 03-01-2016 VERSION 2.0.0

- **IMPORTANT** Changed behaviour of all dynamic methods to include version as an argument rather than in the method name.
- **IMPORTANT** Changed the behaviour of version checking to be more strict
- Changed tests to reflect new behaviour
- Added convenience methods `#win?`, `#osx?` and `#bb?`

#### 03-01-2016 VERSION 1.6.0

- Added more tests
- Added more browsers to check: *(bolt, opera mini and ucbrowser)*
- Added `#known?` method to check if the agent is known
- Added a `#ua` method to return the User Agent string as given to `Browserino.parse()`
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

#### 23-12-2015 VERSION 1.5.1.1

- Removed print statements from method
- Builds are now executed for Ruby 1.9.3 as well as 2.2.1

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
