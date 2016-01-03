## CHANGELOG
_dates are in dd-mm-yyyy format_  

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
