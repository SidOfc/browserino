Browserino
---

Browserino is a tool that parses a user agent string into a convenient object to work with.
This allows developers to gather information about the system of a user on a website without having to ask countless questions
about their browser / OS versions.

## Status

![Licence](https://img.shields.io/badge/license-MIT-E9573F.svg)
[![Gem Version](https://img.shields.io/gem/v/browserino.svg?colorB=E9573F&style=square)](rubygems.org/gems/browserino)
[![Issues](https://img.shields.io/github/issues/SidOfc/browserino.svg)](https://github.com/SidOfc/browserino/issues)
[![Build Status](https://circleci.com/gh/SidOfc/browserino.svg?style=shield)](https://app.circleci.com/pipelines/github/SidOfc/browserino)

## Table of Contents

<details>
<summary>Click to expand Table of Contents</summary>
<ul>
        <li><a href="#browserino">Browserino</a></li>
        <li><a href="#status">Status</a></li>
        <li><a href="#table-of-contents">Table of Contents</a></li>
        <li><a href="#sources">Sources</a></li>
        <li><a href="#changelog">Changelog</a><ul>
            <li><a href="#10-07-2019-version-450">10-07-2019 VERSION 4.5.0</a></li>
            <li><a href="#21-10-2018-version-441">21-10-2018 VERSION 4.4.1</a></li>
            <li><a href="#23-06-2018-version-440">23-06-2018 VERSION 4.4.0</a></li>
        </ul></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#rails--320">Rails (>= 3.2.0)</a><ul>
            <li><a href="#initializer">Initializer</a></li>
        </ul></li>
        <li><a href="#usage">Usage</a><details><summary>show 5 items</summary><ul>
            <li><a href="#client">Client</a></li>
            <li><a href="#formatting">Formatting</a><ul>
                <li><a href="#non-version-like-properties">Non version-like properties</a></li>
                <li><a href="#version-like-properties">Version-like properties</a></li>
            </ul></li>
            <li><a href="#config">Config</a><ul>
                <li><a href="#matchers">Matchers</a></li>
                <li><a href="#aliasses">Aliasses</a></li>
                <li><a href="#labels">Labels</a></li>
                <li><a href="#http-headers">HTTP headers</a></li>
            </ul></details></li>
            <li><a href="#methods">Methods</a><details><summary>show 31 items</summary><ul>
                <li><a href="#name">name</a></li>
                <li><a href="#namesym-opts--">name?(sym, opts = {})</a></li>
                <li><a href="#version">version</a></li>
                <li><a href="#versionversion">version?(version)</a></li>
                <li><a href="#engine">engine</a></li>
                <li><a href="#enginesym-opts--">engine?(sym, opts = {})</a></li>
                <li><a href="#engine_version">engine_version</a></li>
                <li><a href="#engine_versionversion">engine_version?(version)</a></li>
                <li><a href="#platform">platform</a></li>
                <li><a href="#platformsym-opts--">platform?(sym, opts = {})</a></li>
                <li><a href="#platform_label">platform_label</a></li>
                <li><a href="#platform_version">platform_version</a></li>
                <li><a href="#platform_versionversion">platform_version?(version)</a></li>
                <li><a href="#device">device</a></li>
                <li><a href="#devicesym">device?(sym)</a></li>
                <li><a href="#architecture">architecture</a></li>
                <li><a href="#architecturesym">architecture?(sym)</a></li>
                <li><a href="#locale">locale</a></li>
                <li><a href="#locale-1">locale?</a></li>
                <li><a href="#locales">locales</a></li>
                <li><a href="#locales-1">locales?</a></li>
                <li><a href="#x64">x64?</a></li>
                <li><a href="#x32">x32?</a></li>
                <li><a href="#mobile-and-mobile">mobile and #mobile?</a></li>
                <li><a href="#type">type</a></li>
                <li><a href="#typesym">type?(sym)</a></li>
                <li><a href="#like">like</a></li>
                <li><a href="#likesym-opts--">like?(sym, opts = {})</a></li>
                <li><a href="#issym-opts--">is?(sym, opts = {})</a></li>
                <li><a href="#not">not</a></li>
                <li><a href="#notsym-opts--">not?(sym, opts = {})</a></li>
            </ul></li>
            <li><a href="#magic-methods">Magic methods</a><ul>
                <li><a href="#names">Names</a></li>
                <li><a href="#aliasses-1">Aliasses</a></li>
        </ul></li>
        <li><a href="#supported">Supported</a><details><summary>show 8 items</summary><ul>
            <li><a href="#browsers">Browsers</a></li>
            <li><a href="#bots">Bots</a></li>
            <li><a href="#validators">Validators</a></li>
            <li><a href="#libraries">Libraries</a></li>
            <li><a href="#email-clients">Email Clients</a></li>
            <li><a href="#rss">RSS</a></li>
            <li><a href="#platforms">Platforms</a><ul>
                <li><a href="#android">Android</a></li>
                <li><a href="#windows">Windows</a></li>
                <li><a href="#macintosh">Macintosh</a></li>
            </ul></li>
            <li><a href="#devices">Devices</a></li>
        </ul></li></ul></li>
</ul>
</details>

## Sources

Many thanks to the creators and maintainers of the following sources of user agents and timelines:

- [udger.com](https://udger.com/)
- [ua.theafh.net](http://ua.theafh.net/)
- [user-agents.org](http://www.user-agents.org/)
- [zytrax.com](http://www.zytrax.com/tech/web/browser_ids.htm)
- [useragentstring.com](http://www.useragentstring.com/)
- [whatismybrowser.com](https://www.whatismybrowser.com/developers/tools/user-agent-parser/browse)
- [mobile247.eu](http://www.mobile247.eu/online-tools/user-agent-strings)
- [commons.wikimedia.org browser timeline](https://commons.wikimedia.org/wiki/File:Timeline_of_web_browsers.svg)
- [browscap database (github repo)](https://github.com/browscap/browscap/tree/master/resources/user-agents)

## Changelog

_dates are in dd-mm-yyyy format_
older changes can be found in the [changelog](CHANGELOG.md)

### 10-07-2019 VERSION 4.5.0

- Add: browser user-agents
    - `:basilisk`
    - `:facebook_app`
- Add: `:goanna` rendering engine detection
- Add: `:catalina` label for MacOS 10.15.x

### 21-10-2018 VERSION 4.4.1

- Fix: `Browserino.parse` handles `nil` and `false` by converting them to an empty string

### 23-06-2018 VERSION 4.4.0

- Update: Gem dependencies
- Add: ability to supply HTTP headers to Browserino for extra information
- Improve: location will be detected from HTTP headers when available (on by default in Rails)
- Add: [`prop_missing`](#http-headers) DSL for last-minute info gathering
- Add: Android `:pie` label
- Add: `:falkon` alias for `:qupzilla`
`orange_browser`
- Add: `:alohabrowser`
- Add: `:iris`
- Add: `:otter`
- Add: `:chedot`
- Add: `:cm_browser`
- Add: `:diglo`
- Add: `:diigo_browser`
- Add: `:flyflow`
- Add: `:freebox`
- Add: `:kuaiso`
- Add: `:lovense`
- Add: `:slimjet`
- Add: `:zetakey`
- Add: `:wkbrowser`
- Add: `:yolobrowser`
- Add: `:whale`
- Add: `:vivo`
- Add: `:jasmine`
- Add: `:seraphic_sraf`
- Add: `:phantomjs`
- Add: `:slimerjs`
- Add: `:liebao`
- Add: `:w3m`
- Add: `:charon`
- Add: `:cent`
- Add: `:jig_browser_web`
- Add: `:blazer`

## Installation

Add this line to your application's Gemfile:

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

After installing the gem globally or in your application you'll have to `require` the gem before being able to use it.

```ruby
require 'browserino'
```

Afterwards, the gem is loaded and you can proceed by calling:

```ruby
Browserino.parse '<user agent>'[, {'request-header' => 'header-value', ...}]
```

The first argument to `Browserino.parse` is a _user agent_ string. This is the string that browsers send to webservers for identification.
The second (optional) argument to `Browserino.parse` is a hash that contains HTTP headers. When a property could not be found, these headers
will be used by Browserino to attempt to extract it from there if a `prop_missing` handler is defined for it.


Browserino is tested with the following ruby versions

- 2.0.0
- 2.1.0
- 2.2.0
- 2.3.0
- 2.4.0
- 2.5.0

## Rails (>= 3.2.0)

If you're using Rails (>= 3.2.0) you'll have access to a `client` object. Browserino will initialize itself using `request.headers['User-Agent']` and will also use Rails `request.headers` to find
extra information that could not be found in the user agent (e.g. user locales).


A quick example on how to get going:

```ruby
class ExampleController < ApplicationController
  def example_method
    render json: client.to_json
  end
end
```

### Initializer

If you would like to extend Browserino within your rails app, this is certainly possible.
Create a file _config/initializers/browserino.rb_ and add the following:

```ruby
Browserino.config.define do
  # your magic here
end
```

Please skip ahead to the [**Config**](#config) part of the documentation, that section contains information on how to make use of Browserino's builtin DSL

## Usage

### Client

the `parse` method will **always** return a `Browserino::Client` object. This object is special in that it simply resonds to everything. If a property does not exist or isn't defined on the current instance of `client` then it will simply return `nil`. Parsing an empty user agent will result in the following output:

```ruby
client = Browserino.parse ''
client.is_a? Browserino::Client # => true
```

Prior to version `4.4.1`, `Browserino.parse nil` or `Browserino.parse false` were invalid. As of `4.4.1` an empty user agent (`''`) is assumed when these values are used.

### Formatting

This section explains the output / return values given by calling a method on an instantiated `Browserino::client` object.

#### Non version-like properties

Non-version-like properties are properties that are not solely digits seperated by a delimiter like '.' or '\_'.
All the non-version-like property values (which aren't `Array` or `Hash` instances) will be formatted in the following order:

- skip following steps if `Array` or `Hash`
- stringify value
- lowercase all characters
- strip spaces on either side
- replace one or more spaces or dashes with a single underscore (`_`)
- convert to symbol

```ruby
client = Browserino.parse 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:24.0) Gecko/20100101 Firefox/24.0 Waterfox/24.0'

client.name           # => :waterfox
client.type           # => :browser
client.platform       # => :windows
client.engine         # => :gecko
client.platform_label # => :windows7
```

#### Version-like properties

All the version-like property values will be converted to `Browserino::Version` objects.
These objects are comparable to numbers and version-like strings (e.g. `'1.2.4'`)

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36'

client.version                           # => [37, 0, 2062, 124]
client.version.is_a? Browserino::Version # => true
client.version.is_a? Array               # => true

# get full version
client.version.full # => '37.0.2062.124'
client.version.to_s # => '37.0.2062.124'

# get version components [major, minor, patch]
client.version.major # => 37
client.version.minor # => 0
client.version.patch # => 2062

# comparing with integers
client.version >= 32          # => true
client.version < 40           # => true

# comparing with strings
client.version >= '37.0.2000' # => true
client.version > '37.1.2000'  # => false
```

### Config

#### Matchers

Browserino is based on a concept of _matchers_, a matcher is a single client entity.
They are defined in a `Browserino.config.define { ... }` block. A small example:

```ruby
Browserino.config.define do
  # define a matcher that looks for the pattern %r{mybrowser}i in the UA
  # when found, give it a name of :mybrowser and a type of :browser
  match %r{mybrowser}i, name: :mybrowser, type: :browser
end

ua = "Mozilla/5.0 (Windows NT 5.1; rv: 1.8.3.2) Gecko/13370420 MyBrowser/1.4.9"

client = Browserino.parse ua
client.to_h
# => { :name             => :mybrowser,
#      :type             => :browser,
#      :locale           => nil,
#      :locales          => [],
#      :architecture     => nil,
#      :mobile           => false,
#      :smarttv          => false,
#      :tablet           => false,
#      :platform         => :windows,
#      :platform_version => [5, 1],
#      :version          => [1, 4, 9],
#      :engine_version   => [],
#      :device           => nil,
#      :label            => nil,
#      :engine_label     => nil,
#      :platform_label   => :xp }

client.name
# => :mybrowser
```

In the above example, I've simply created a fictive UA to simulate how to add a matcher to Browserino.
This matcher however, isn't all that powerful as all it does is match a pattern and assign a name and type.
Browserino hosts a large list of defaults that you don't have to support anymore, these are all matchers themselves.
The matcher for Firefox looks like this for instance:

```ruby
Browserino.config.define do
  # this matcher is written using the dsl style, calling a method and giving
  # it a value, something to look for in the user agent, or a block will
  # add that method name as a property with the parsed value as result

  # match pattern %r{firefox|phoenix}i
  match %r{firefox|phoenix}i do
    # give this matcher a name of :firefox
    name           :firefox
    # engine is a regexp, these will be matched on the UA and return their
    # respective match (what is captured in a capture group)
    engine         %r{(gecko|servo)}i
    # engine_version is also a regexp, because the gecko version isn't defined
    # like gecko/[VERSION] but rather rv:[VERSION] while for servo it is
    # servo/[VERSION]
    engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
    # last but not least we can also define a block, the block
    # will be executed once after all other properties have been defined on a
    # client, the block itself will be executed in client context so
    # everything you can do on a `client` can also be used within blocks
    modern?        { version >= 50 }
  end
end
```

Now as you may have noticed, there is no `type` defined in the above matcher, so how does Browserino know that Firefox is a browser?
In truth, you aren't seeing the whole file here, if you want to go take a look, you can [find it here](https://github.com/SidOfc/browserino/blob/master/lib/browserino/definitions/matchers.rb). To elaborate, Browserino has a few builtin convenience methods
That allow presetting of `type` in a nice way using:


```ruby
Browserino.config.define do
  # sets type: :browser for each matcher defined within the block
  browsers do
    # matcher %r{...}i
    # matcher %r{...}i
    # matcher %r{...}i
  end

  # sets type: :email for each matcher defined within the block
  emails do
    # ....
  end

  # sets type: :validator for each matcher defined within the block
  validators do
    # ....
  end

  # sets type: :bot for each matcher defined within the block
  bot do
    # ....
  end

  # sets type: :library for each matcher defined within the block
  libraries do
    # ....
  end
end
```

Under the hood, these all use a more generic `preset` method as also seen in the [source](https://github.com/SidOfc/browserino/blob/master/lib/browserino/config.rb#L71-L89):

```ruby
# snipped from Browserino::Config
def emails(opts = {}, &block)
  preset opts.merge(type: :email), &block
end

def validators(opts = {}, &block)
  preset opts.merge(type: :validator), &block
end

def browsers(opts = {}, &block)
  preset opts.merge(type: :browser), &block
end

def bots(opts = {}, &block)
  preset opts.merge(type: :bot), &block
end

def libraries(opts = {}, &block)
  preset opts.merge(type: :library), &block
end
```

All that these methods, and `preset` do is they set an instance variable with all the properties you'll have supplied in an options hash and these will simply be applied to every matcher defined within them. The Firefox matcher could have been written in the following ways:

```ruby
Browserino.config.define do
  # using `browsers`

  browsers do
    match %r{firefox|phoenix}i do
      name           :firefox
      engine         %r{(gecko|servo)}i
      engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
      modern?        { version >= 50 }
    end
  end

  # using `preset`
  preset type: :browser do
    match %r{firefox|phoenix}i do
      name           :firefox
      engine         %r{(gecko|servo)}i
      engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
      modern?        { version >= 50 }
    end
  end

  # define type inline
  match %r{firefox|phoenix}i, type: :browser do
    name           :firefox
    engine         %r{(gecko|servo)}i
    engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
    modern?        { version >= 50 }
  end
  # or
  match %r{firefox|phoenix}i do
    name           :firefox
    type           :browser
    engine         %r{(gecko|servo)}i
    engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
    modern?        { version >= 50 }
  end
end
```

You'll have also noticed that so far, no `version` property has been defined either, and that when we created the `mybrowser` matcher, it could actually find it's version without supplying it.
This is a different type of matcher at work. It is not a matcher for a single entity but rather, one that will be applied by default if nothing is specified.
It is then capable of extracting preprocessed information into a pattern that will magically detect the version for you.

They look like this:


```ruby
Browserino.config.define do
  #           prop             pattern                          flags
  smart_match :version,        with: ':name[\s/]?v?([\d\._]+)', flags: [:i]
  smart_match :engine_version, with: ':engine[\s/]?([\d\._]+)', flags: [:i]
end
```

What the above code does is, if no `version` property has been supplied to a matcher, it will try to look for a `smart_watcher` with a prop of `version`, then, using other parsed properties, it will replace the `:name` in this case with `mybrowser` (if we were to use our made-up UA). The pattern would then look like this: `/mybrowser[\s/]?v?([\d\.]+)/i` and go a head and match itself against the UA to get a value back.

If you supply your own `version` property, this `smart_matcher` will not be applied.

#### Aliasses

Aliasses are a bit simpler than `Matchers`, they look like this taken from the [source](https://github.com/SidOfc/browserino/blob/master/lib/browserino/definitions/aliasses.rb):

```ruby
Browserino.config.define do
  # aliasses will be defined after a Client has been initialized
  # only the aliasses matching the Client will be defined
  alias_for :firefox,    :ff
  alias_for :windows,    :win
  alias_for :windows7,   :win7
  alias_for :windows8,   :win8
  alias_for :windows10,  :win10
  alias_for :macintosh,  :mac, :osx, :macos
  alias_for :blackberry, :bb
  alias_for :ie,         :internet_explorer
  alias_for :facebook,   :fb
  alias_for :duckduckgo, :ddg
  alias_for :chromeos,   :cros
end
```

What they do is they look for a value within the properties of a specific client and if found, all the aliasses specified will also be applied to that client.
This means that for a `client.is? :firefox` you can do `client.is? :ff` or `client.ff?` instead. This works for all the names like `name, label`, `engine`, `engine_label`, `platform` and `platform_label`

#### Labels

A label could be a codename or a specific OS name for instance, it applies to a name and it's respective version combination.
It autodetects against which version it should match, this will always be the correct version. Here are some examples (also not the complete file -  [source](https://github.com/SidOfc/browserino/blob/master/lib/browserino/definitions/labels.rb)):

```ruby
# small subset of labels from the source
Browserino.config.define do
  label :yosemite,           for: :macintosh, range: '10.10'..'10.10.9'
  label :el_capitan,         for: :macintosh, range: '10.11'..'10.11.9'
  label :sierra,             for: :macintosh, range: '10.12'..'10.12.9'
end
```

So now it looks for a value of `:macintosh` in the properties gathered from a client, if it finds it, it will remember it's key (e.g. `platform` in this case.) and use it to find out the current version (e.g. `platform_version` in this case). If a version is supplied it will be compared to be `>= min` and `<= max` (which is inclusive) where `min` and `max` are the left and right values of the `range` option respectively.

#### HTTP headers

Browserino as of version `4.4.0` accepts a hash of HTTP headers as a second argument. This adds more detailed information (primarily `#locales` property is added and `#locale` is read from it when not found).
For Rails, this is already implemented and will work out of the box, adding support for it is as simple as supplying a `Hash` of HTTP headers (say, what you get from a `request.headers` in Rails or `request` from Sinatra) as second argument to `Browserino.parse`.

This user agent does not have a locale but when we supply the `HTTP_ACCEPT_LANGUAGE` (or just `Accept-Language`) header it will find _all_ languages ordered by _user preference_ in a `#locales` property.
For the [`#locale`](#locale) itself, if it is not found it will attempt to use [`#locales.first`](#locales):

```ruby
client = Browserino.parse(
    'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36',
    {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.6,nl;q=0.7'}
)

client.locales
# => [:en_us :en :nl :nl_nl]

client.locale
# => :en_us
```

The behavior is defined by `prop_missing` hooks which will be run _just_ before a new `Client` (and _after_ all data gathering / processing is done) is initialized.
The hooks for `:locales` and `:locale` look like this:

```ruby
Browserino.config.define do
  prop_missing :locales do |http_headers|
    http_headers[:accept_language]
      .to_s.scan(/(\w{2}(?:[_\-]\w{2})?)(?:;q=([\d.]+))?/i)
      .map { |(locale, quality)| [locale, (quality || 1).to_f] }
      .sort_by { |a| -a[1] }
      .map(&:first)
  end

  prop_missing :locale do |_http_headers, props|
    props[:locales].first
  end
end
```

The first block argument is a processed version of a hash with HTTP headers.
Keys of this hash are "normalized", any `HTTP_` prefix is removed, `-` is replaced with `_` and finally the key is lowercased and converted to a symbol.
This allows you to pass in raw header names as seen in the request like `Accept-Language` or Rails / Sinatra (read: rack) HTTP headers like `HTTP_ACCEPT_LANGUAGE`. Both will end up as `:accept_language` allowing for easy usage.

The second block argument are the processed properties. This is _all_ the information from the UA / HTTP headers that Browserino could find combined.

What you may also notice here is that in the second `prop_missing` we are leveraging the first `prop_missing`. They are executed in order of definition to make it easy to "chain" property fallbacks.

### Methods

The below methods are available by default, all methods with a questionmark at the end return either boolean `true` or `false` or `nil`.

#### #name

Returns either a symbol containing the name of the agent or `nil` otherwise.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.name
# => :colibri
```

#### #name?(sym, opts = {})

Returns true if supplied `sym` equals (`==`) the current `client.name`, if `opts` contains a `:version` key, it will be compared against `#version`
Returns false if the supplied criteria doesn't match the current client.
Returns nil if `sym` isn't the current client, regardless of version constraint

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.name? :colibri
# => true

client.name? :colibri, version: '1.0.0'
# => true

client.name? :colibri, version: '1.1.0'
# => false

client.name? :not_colibri
# => nil

client.name? :not_colibri, version: '1.0.0'
# => nil
```

#### #version

Returns a `Browserino::Version` object. This object allows for more flexible comparing of long version numbers where simple numbers or floats don't suffice.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.version
# => [1, 0, 0]

client.version.is_a? Browserino::Version
# => true

# logical operators can be used for comparison

# it can work with integers
client.version >= 1
# => true

# or strings
client.version >= '1.0.0'
# true

client.version.to_s
# or
client.version.full
# => '1.0.0'
```

#### #version?(version)

Returns true if the supplied version equals (`==`) the current clients version.
Returns false otherwise

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.version? 1
# true

client.version? '1.0'
# true

client.version? '1.0.0'
# true

client.version? '1.0.1'
# false
```

#### #engine

Returns either a symbol containing the engine of the agent or `nil` otherwise.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.engine
# => :webkit
```

#### #engine?(sym, opts = {})

Returns true if supplied `sym` equals (`==`) the current `client.version`, if `opts` contains a `:version` key, it will be compared against `#engine_version`
Returns false if the supplied criteria doesn't match the current client.
Returns nil if `sym` isn't the current client, regardless of version constraint

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.engine? :webkit
# => true

client.engine? :webkit, version: '537.36'
# => true

client.engine? :webkit, version: '537.38'
# => false

client.engine? :not_webkit
# => nil

client.engine? :not_webkit, version: '537.36'
# => nil
```

#### #engine_version

Returns a [`Browserino::Version`](#version) object.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.engine_version
# => [537, 36]

client.engine_version >= 530
# true

client.engine_version.to_s
# or
client.engine_version.full
# => '537.36'
```

#### #engine_version?(version)

Returns true if the supplied version equals (`==`) the current clients engine_version.
Returns false otherwise

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.engine_version? '537.36'
# true
```

#### #platform

Returns either a symbol containing the platform of the agent or `nil` otherwise.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.platform
# => :macintosh
```

#### #platform?(sym, opts = {})

Returns true if supplied `sym` equals (`==`) the current `client.platform`, if `opts` contains a `:version` key, it will be compared against `#platform_version`
Returns false if the supplied criteria doesn't match the current client.
Returns nil if `sym` isn't the current client, regardless of version constraint

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.platform? :macintosh
# => true

client.platform? :macintosh, version: '10.12'
# => true

client.platform? :macintosh, version: '10.12.2'
# => false

client.platform? :not_macintosh
# => nil

client.platform? :not_macintosh, version: '10.12.1'
# => nil
```

#### #platform_label

Returns either a symbol containing the platform_label of the agent or `nil` otherwise.

```ruby
client  = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'
client2 = Browserino.parse 'Mozilla/5.0 (Linux; Android 7.0; LG-H910 Build/NRD90C) AppleWebKit/537.26 (KHTML, like Gecko) Chrome/51.0.2704.90 Mobile Safari/537.36'

# macOS 10.12's name is Sierra
client.platform_label
# => :sierra

# Android 7's name is Nougat
client2.platform_label
# => :nougat
```

#### #platform_version

Returns a [`Browserino::Version`](#version) object.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.platform_version
# => [10, 12, 1]

client.platform_version >= 10
# => true

client.platform_version.to_s
# or
client.platform_version.full
# => '10.12.1'
```

#### #platform_version?(version)

Returns true if the supplied version equals (`==`) the current clients platform_version.
Returns false otherwise

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.platform_version? '10.12'
# => true
```
#### #device

Returns either a symbol containing the device of the client or `nil` otherwise

```ruby
client = Browserino.parse 'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36'

client.device
# => :zte
```

#### #device?(sym)

Returns true if the supplied sym equals (`==`) the current clients device.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Linux; Android 5.1; ZTE Blade L6 Build/LMY47I) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.91 Mobile Safari/537.36'

client.device
# => :zte
```

#### #architecture

Returns either `nil`, `:x32` or `:x64` depending on wether it could be found in the user agent

```ruby
client  = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'
client2 = Browserino.parse 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36 Vivaldi/1.0.288.3'

client.architecture
# => nil

client2.architecture
# => :x64
```

#### #architecture?(sym)

sym must be one of `:x32` or `:x64`, returns `true` if it matches the current client architecture, false otherwise.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.architecture? :x64
# => false
```
#### #locale

Returns either `nil` or a locale if present. Locales are formatted like `:en_us` for `en-US` and `en_US` and just `:en` for `en`.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; U; Macintosh; en-US; Valve Steam GameOverlay/1329175982; ) AppleWebKit/534.1 (KHTML, like Gecko) Chrome/6.0.444.0 Safari/534.1'

client.locale
# => :en_us
```
#### #locale?

Returns `true` or `false` based on locale presence.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; U; Macintosh; en-US; Valve Steam GameOverlay/1329175982; ) AppleWebKit/534.1 (KHTML, like Gecko) Chrome/6.0.444.0 Safari/534.1'

client.locale?
# => true
```
#### #locales

Returns an array of locales found in `Accept-Language` HTTP header. This only works when `Browserino.parse` is invoked with a hash containing the headers as second argument.
When locales are found using this method, they will be used instead of the [`#locale`](#locale) found in the user agent (the locale will be replaced with the highest quality locale from the header).

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; U; Macintosh; pt-BR; Valve Steam GameOverlay/1329175982; ) AppleWebKit/534.1 (KHTML, like Gecko) Chrome/6.0.444.0 Safari/534.1',
                          {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.8,nl;q=0.7'}

# locale is :en_us because it is present in headers and thus overwrites :pt_br
client.locale
# => :en_us

# the :pt_br locale gets added as the least preferred locale instead
client.locales
# => [:en_us, :en, :nl_nl, :nl, :pt_br]
```

#### #locales?

Returns `true` or `false` depending on wether any locales were found at all (e.g. from UA and/or HTTP headers).

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; U; Macintosh; pt-BR; Valve Steam GameOverlay/1329175982; ) AppleWebKit/534.1 (KHTML, like Gecko) Chrome/6.0.444.0 Safari/534.1',
                          {'HTTP_ACCEPT_LANGUAGE' => 'en-US,en;q=0.9,nl-NL;q=0.8,nl;q=0.7'}

client.locales?
# => true
```

#### #x64?

A shorthand for `client.architecture? :x64` returns a boolean value

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.x64?
# => false
```

#### #x32?

A shorthand for `client.architecture? :x32` returns a boolean value

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.x32?
# => false
```

#### #mobile and #mobile?

Returns boolean `true` or `false` depending on wether the device user agent is a mobile device

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.mobile
# or
client.mobile?
# => false
```

#### #type

There are currently 6 types defined, `:browser`, `:bot`, `:library`, `:validator`, `:email` and `:unknown` _(default)_
This method simply returns the type of the current client, e.g.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.type
# => :browser
```

#### #type?(sym)

Returns true if `sym` equals (`==`) the current clients type

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36'

client.type? :browser
# => true

client.type? :bot
# => false
```

#### #like

Like is something  different. Within the defaults a few browsers are defined to be `like` others. This is the full list:

- Like `:chrome` includes:
  - `:brave`
  - `:vivaldi`
  - `:colibri`
  - `:rockmelt`
  - `:flock`
  - `:comodo_dragon`
  - `:steam` (Game interface)
  - `:chromeplus`
  - `:bluechrome`
  - `:awesomium`
  - `:qqbrowser`
  - `:yabrowser`
  - `:coolnovo`
  - `:iridium`
  - `:origin`
  - `:puffin`
  - `:fluid`
  - `:hana`
  - `:iron`
- Like `:safari` includes:
  - `:bolt`
  - `:samsungbrowser`
  - `:webosbrowser`
  - `:stainless`
  - `:omnibrowser`
  - `:cheshire`
  - `:skyfire`
  - `:mercury`
  - `:rekonq`
  - `:arora`
  - `:raptr`
  - `:icab`
  - `:silk`
  - `:qt`
- Like `:firefox` includes:
  - `:seamonkey`
  - `:minefield` (FF nightly)
  - `:kmeleon`
  - `:kninja`
  - `:granparadiso`
  - `:tenfourfox`
  - `:enigmafox`
  - `:kazehakase`
  - `:shiretoko`
  - `:classilla`
  - `:cometbird`
  - `:icedragon`
  - `:palemoon`
  - `:namoroka`
  - `:songbird`
  - `:vonkeror`
  - `:conkeror`
  - `:bonecho`
  - `:chimera`
  - `:lolifox`
  - `:lorentz`
  - `:myibrow`
  - `:sylera`
  - `:iceape`
  - `:madfox`
  - `:kapiko`
  - `:kmlite`
  - `:beonex`
  - `:galeon`
  - `:vision`
  - `:pogo`
  - `:orca`
  - `:superswan`
  - `:firebird`
  - `:iceweasel`
  - `:icecat`
  - `:waterfox`
  - `:netscape`
  - `:prism`
  - `:lunascape`
  - `:camino`
- Like `:ie` includes:
  - `:avant_browser`
  - `:deepnet_explorer`
  - `:slimbrowser`
  - `:sleipnir`
  - `:greenbrowser`
  - `:browzar`
  - `:theworld`
  - `:crazy_browser`
  - `:solid_core`
  - `:tencenttraveler`
  - `:enigma_browser`
  - `:simulbrowse`
  - `:netcaptor`
  - `:irider`
  - `:kkman`
  - `:lobo`
  - `:aol`

```ruby
# In this case, seamonkey is like firefox so like will represent the same user agent parsed as firefox to gather information
client = Browserino.parse 'Mozilla/5.0 (Windows NT 5.2; RW; rv:7.0a1) Gecko/20091211 SeaMonkey/9.23a1pre'

client.name
# => :seamonkey

client.is_a? Browserino::Client
# => true

client.like.name
# => :firefox

client.like.is_a? Browserino::Client
# => true

client == client.like
# => false

# This client isn't `like` anything, it's just chrome so in this case, we assign the value of like to itself.
client2 = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36'

client2.name
# => :chrome

client2.is_a? Browserino::Client

client.like.name
# => :chrome

client2.like.is_a? Browserino::Client
# => true

client == client.like
# => true
```

#### #like?(sym, opts = {})

This method acts much like the `name?` method on a client except that like `like` method will match a broader set of things like it.
Additionally, you can also supply an optional `:version` option which will then be compared to the `like.version` property.
Seamonkey in the last example is the browser I chose to be an example for the `like` documentation, since Seamonkey is like firefox we can do this:

```ruby
# In this case, seamonkey is like firefox so like will represent the same user agent parsed as firefox to gather information
client = Browserino.parse 'Mozilla/5.0 (Windows NT 5.2; RW; rv:7.0a1) Gecko/20091211 SeaMonkey/9.23a1pre'

client.name
# => :seamonkey

client.name? :seamonkey
# => true

client.name? :firefox
# => false

client.like? :firefox
# => true

# A version can be supplied too but in this case, FireFox's version number
# isn't present in the user agent
# client.like? :firefox, version: '9.23'
# => false
```

#### #is?(sym, opts = {})

The `is?` method is a bit more loose, it will recognize what it is and what it isn't automagically depending on what's passed in.
It can be a more general replacement for [#name?](#name), [#engine?](#engine) and [#platform?](#platform)

#### #not

Inverts the result returned by any method ending in a question mark (e.g. `client.version? == true && client.not.version? == false`)

#### #not?(sym, opts = {})

An inverted version of `#is?`

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36'
client.to_h
# => { :name             => :chrome,
#      :type             => :browser,
#      :locale           => nil,
#      :architecture     => nil,
#      :mobile           => false,
#      :smarttv          => false,
#      :tablet           => false,
#      :platform         => :macintosh,
#      :platform_version => [10, 11, 2],
#      :version          => [47, 0, 2526, 106],
#      :engine           => :webkit,
#      :engine_version   => [537, 36],
#      :device           => nil
#      :label            => nil,
#      :engine_label     => nil,
#      :platform_label   => :el_capitan }

client.not? :chrome
# => false

# compares to a name of chrome with version of 47.0
client.not? :chrome, version: '47.0'
# => false

# but it also knows about platforms
client.not? :macintosh
# => false

# the version is matched against the platform_version in this case
client.not? :macintosh, version: '10.11'
# => false

# and engine names
client.not? :webkit
# => false

# where the version is compared to the engine_version
client.not? :webkit, version: 537
# => false
```

### Magic methods

#### Names

For each of `#name`, `#engine`, `#platform`, `#platform_label` and `#device`, upon instantiation of the current client object, the **results** of these methods will also be defined as methods if they aren't nil e.g:

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36'
client.to_h
# => { :name             => :chrome,
#      :type             => :browser,
#      :locale           => nil,
#      :architecture     => nil,
#      :mobile           => false,
#      :smarttv          => false,
#      :tablet           => false,
#      :platform         => :macintosh,
#      :platform_version => [10, 11, 2],
#      :version          => [47, 0, 2526, 106],
#      :engine           => :webkit,
#      :engine_version   => [537, 36],
#      :device           => nil,
#      :label            => nil,
#      :engine_label     => nil,
#      :platform_label   => :el_capitan }

### NAME ###

# since client.name is :chrome, a method #chrome? is defined
client.chrome?
# => true

# an optional version can also be suppied
client.chrome? 47
# => true

# since client.name isn't :firefox, no method named #firefox? is defined
# instead, it is sent to method_missing which will return nil
client.firefox?
# => nil

# supplying a version of course, makes no difference in this case
client.firefox? 47
# => nil

### ENGINE NAME ###

# since client.engine_name is :webkit, a method #webkit? is defined
client.webkit?
# => true

# an optional version can also be suppied
client.webkit? '537.36'
# => true

# since client.engine_name isn't :gecko, no method named #gecko? is defined
# instead, it is sent to method_missing which will return nil
client.gecko?
# => nil

# supplying a version of course, makes no difference in this case
client.gecko? 50
# => nil

### PLATFORM NAME ###

# since client.platform_name is :macintosh, a method #macintosh? is defined
client.macintosh?
# => true

# an optional version can also be suppied
client.macintosh? '10.11'
# => true

# since client.platform_name isn't :windows, no method named #windows? is defined
# instead, it is sent to method_missing which will return nil
client.windows?
# => nil

# supplying a version of course, makes no difference in this case
client.windows? 10
# => nil

### PLATFORM LABEL ###

# since client.platform_label is :el_capitan, a method #el_capitan? is defined
client.el_capitan?
# => true

# an optional version can also be suppied
client.el_capitan? '10.10'
# => true
```

#### Aliasses

For each of the defined keys in `Browserino.config.aliasses` that matches with any value of `#name`, `#engine`, `#platform` or `#platform_label`, define every alias as a method.

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0'

### NAME ###

client.name
# => :firefox

Browserino.config.aliasses[client.name]
# => [:ff]

client.firefox?
# => true

client.ff?
# => true

### PLATFORM NAME ###

client.platform
# => :macintosh

Browserino.config.aliasses[client.platform]
# => [:macos, :osx, :mac]

client.macos?
# => true

client.osx?
# => true

client.mac?
# => true
```

Aliasses can also be used in `#name?`, `#engine?`, `#platform?` and `#is?` methods, e.g:

```ruby
client = Browserino.parse 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0'

### NAME ###

client.name
# => :firefox

client.name? :firefox
# => true

client.name? :ff
# => true

client.name? :ff, version: 33
# => true

client.is? :firefox
# => true

client.is? :ff
# => true

client.is? :ff, version: 33
# => true

### PLATFORM NAME ###

client.platform
# => :macintosh

# Browserino.config.aliasses[:macintosh] defines [:mac, :osx, :macos] as aliasses

client.platform? :macintosh
# => true

client.platform? :mac
# => true

client.platform? :osx
# => true

client.platform? :macos
# => true

client.platform? :macos, version: '10.10'
# => true
```

## Supported

### Browsers

`aol`, `ion`, `foxy`, `lobo`, `kkman`, `irider`, `sleipnir`, `netcaptor`, `sitekiosk`, `gomezagent`, `solid_core`, `simulbrowse`, `crazy_browser`, `enigma_browser`, `tencenttraveler`, `deepnet_explorer`, `sogou_browser`, `netflix_desktop`, `browzar`, `theworld`, `smart_bro`, `slimbrowser`, `greenbrowser`, `avant_browser`, `orca`, `pogo`, `epic`, `kylo`, `wyzo`, `light`, `prism`, `strata`, `vision`, `galeon`, `icecat`, `minimo`, `beonex`, `kmlite`, `kapiko`, `madfox`, `iceape`, `fennec`, `sylera`, `myibrow`, `lorentz`, `lolifox`, `chimera`, `sundial`, `bonecho`, `k_ninja`, `k_meleon`, `netscape`, `conkeror`, `vonkeror`, `firebird`, `songbird`, `namoroka`, `cyberfox`, `palemoon`, `swiftfox`, `cunaguaro`, `icedragon`, `blackbird`, `cometbird`, `classilla`, `shiretoko`, `lunascape`, `superswan`, `lightning`, `multizilla`, `seamonkey`, `iceweasel`, `enigmafox`, `kazehakase`, `tenfourfox`, `swiftweasel`, `granparadiso`, `maemo_browser`, `sailfishbrowser`, `monyq`, `waterfox`, `minefield`, `fireweb_navigator`, `camino`, `maemo`, `opera_mobile`, `blackberry_browser`, `webosbrowser`, `leechcraft`, `kindle`, `nook`, `xiaomi_miui`, `qt`, `coda`, `silk`, `bolt`, `icab`, `raptr`, `maple`, `arora`, `coast`, `rekonq`, `mercury`, `skyfire`, `omniweb`, `teashark`, `cheshire`, `stainless`, `webbrowser`, `mqqbrowser`, `nokiabrowser`, `samsungbrowser`, `playbook_browser`, `obigo`, `qtweb_browser`, `maxthon_nitro`, `nichrome`, `iron`, `hana`, `perk`,
`brave`, `swing`, `kinza`, `fluid`, `amigo`, `puffin`, `origin`, `yowser`, `iridium`, `colibri`, `vivaldi`, `safepay`, `slimboat`, `coolnovo`, `rockmelt`, `polarity`, `chromeum`, `yabrowser`, `qqbrowser`, `awesomium`, `mxbrowser`, `fabrowser`, `blackhawk`, `taobrowser`, `bluechrome`, `chromeplus`, `comodo_dragon`, `coc_coc_browser`, `whitehat_aviator`, `steam`, `maxthon`, `ucbrowser`, `edge`, `opera_mini`, `opera`, `escape`, `flock`, `sunrise`, `ie`, `origyn`, `webpositive`, `nintendobrowser`, `deskbrowse`, `qupzilla`, `midori`, `shiira`, `element_browser`, `amigavoyager`, `browse`, `mothra`, `surf`, `spray_can`, `bunjalloo`, `inet_browser`, `webpro`, `sundance`, `ibm_webexplorer`, `navscape`, `firefox`, `chrome`, `safari`, `tizenbrowser`, `epiphany`, `uzbl`, `roccat`, `dolfin`, `dooble`, `adobeair`, `abrowse`, `vimprobable`, `osb_browser`, `edbrowse`, `amaya`, `lynx`, `linemode`, `elinks`, `netpositive`, `mucommander`, `onebrowser`, `flashfire`, `konqueror`, `cyberdog`, `offbyone`, `hotjava`, `netsurf`, `contiki`, `mosaic`, `netbox`, `dillo`, `ice_browser`, `emacs`, `openwave_browser`, `alienblue`, `ovibrowser`, `links`, `oregano`, `browsex`, `doris`, `retawq`, `orange_browser`, `alohabrowser`, `iris`, `otter`, `chedot`, `cm_browser`, `diglo`, `diigo_browser`, `flyflow`, `freebox`, `kuaiso`, `lovense`, `slimjet`, `zetakey`, `wkbrowser`, `yolobrowser`, `whale`, `vivo`, `jasmine`, `seraphic_sraf`, `phantomjs`, `slimerjs`, `liebao`, `w3m`, `charon`, `cent`, `jig_browser_web`, `blazer`

### Bots

`huaweisymantecspider`, `atomic_email_hunter`, `netresearchserver`, `auto_email_spider`, `flaming_attackbot`, `addsugarspiderbot`, `semanticdiscovery`, `xaldon_webspider`, `yooglifetchagent`, `keyword_density`, `mass_downloader`, `safetynet_robot`, `download_demon`, `internet_ninja`, `dataparksearch`, `boston_project`, `emailcollector`, `webemailextrac`, `sitelockspider`, `morning_paper`, `four_anything`, `aqua_products`, `arachnophilia`, `smartdownload`, `emeraldshield`, `womlpefactory`, `israelisearch`, `issuecrawler`, `jaxified_bot`, `stackrambler`, `turnitinbot`, `covario_ids`, `alkalinebot`, `yahoo_slurp`, `propowerbot`, `emailsiphon`, `backdoorbot`, `terrawizbot`, `searchsight`, `baiduspider`, `sandcrawler`, `fyberspider`, `linguee_bot`, `big_brother`, `yahooseeker`, `noxtrumbot`, `black_hole`, `blackwidow`, `sosospider`, `duckduckgo`, `beslistbot`, `twitterbot`, `linkdexbot`, `aitcsrobot`, `litefinder`, `mabontland`, `yasaklibot`, `httpclient`, `ahrefsbot`, `mojeekbot`, `incywincy`, `seznambot`, `girafabot`, `becomebot`, `dts_agent`, `emailwolf`, `googlebot`, `omgilibot`, `labelgrab`, `altavista`, `yandexbot`, `newsgator`, `instagram`, `pinterest`, `gurujibot`, `lapozzbot`, `mvaclient`, `ng_search`, `youdaobot`, `webcopier`, `ips_agent`, `yodaobot`, `ldspider`, `lexxebot`, `scoutjet`, `linkedin`, `bullseye`, `alexibot`, `whatsapp`, `facebook`, `getright`, `asterias`, `catchbot`, `discobot`, `geniebot`, `koepabot`, `synoobot`, `rufusbot`, `rampybot`, `mogimogi`, `lmspider`, `blowfish`, `superbot`, `valkyrie`, `yacybot`, `jyxobot`, `orbiter`, `polybot`, `accoona`, `mj12bot`, `aspider`, `blexbot`, `bspider`, `auresys`, `bingbot`, `gaisbot`, `zealbot`, `zspider`, `backrub`, `harvest`, `nymesis`, `radian6`, `scrubby`, `gcreep`, `snappy`, `vortex`, `tineye`, `zyborg`, `sqworm`, `qseero`, `pompos`, `solbot`, `ichiro`, `bizbot`, `msnbot`, `exabot`, `msrbot`, `dotbot`, `cosmos`, `ecatch`, `scrapy`, `tumblr`, `holmes`, `okhttp`, `mxbot`, `moget`, `occam`, `acoon`, `nutch`, `alexa`, `atomz`, `htdig`, `peew`, `yeti`, `wf84`, `vyu2`, `acoi`, `obot`, `ask`, `b2w`, `ipd`, `zao`, `furlbot`, `jakarta`, `oegp`, `lwebis`, `cerberian_drtrs`, `gigamega`, `sogou_spider`, `megaindex`, `gozilla`, `larbin`, `netseer`, `ntent`, `sheenbot`

### Validators

`xenu_link_sleuth`, `screaming_frog_seo_spider`, `rel_link_checker_lite`, `a1_website_analyzer`, `w3c_multipage_validator`, `cse_html_validator`, `p3p_validator`, `w3c_checklink`, `w3c_i18n_checker`, `w3c_unicorn`, `w3c_mobileok`, `wdg_validator`, `w3c_validator`, `fplinkchecker`, `linkchecker`, `linkwalker`, `linkexaminer`, `feedvalidator`, `htmlparser`, `csscheck`, `checkbot`, `cynthia`, `validator_nu`, `anw_htmlchecker`, `w3c_css_validator`

### Libraries

`golang`, `python`, `luakit`, `webfetch`, `pycurl`, `perl`, `java`, `curl`, `wget`, `php`

### Email Clients

`:outlook`, `:airmail`, `:barca`, `:gmail`, `:thunderbird`, `:postbox`, `spicebird`, `icedove`

### RSS

`windows_rss`, `apple_pubsub`, `safari_rss`, `sharpreader`, `netnewswire`, `omea_reader`, `rssbandit`, `feeddemon`, `lucknews`, `inoreader`, `rss_menu`, `rss_popper`, `seznam_rss`, `nfreader`, `magpierss`, `gregarius`, `newsbreak`, `blogbridge`, `yeahreader`, `newsbeuter`, `greatnews`, `bloglines`, `icatcher`, `newsfox`, `quiterss`, `liferea`, `aiderss`, `reeder`, `rssowl`, `feedly`, `abilon`, `shrook`, `awasu`, `sage`, `akregator`, `trileet_newsroom`, `dragonfly_rss`, `digg_feed_fetcher`, `yahoofeedseeker`, `universalfeedparser`, `feedfetcher_google`, `fastladder_feedfetcher`

### Platforms

In addition to just supporting regular platform names as `client.android?`, there are also specific methods that get added if a certain version matches a platform.
This is the _platform\_label_ property and allows you to do things like `client.froyo?` for instance.

Below are a list of versions the agent can identify so far

#### Android

Regular: `:android`

`:android`, `:cupcake`, `:eclair`, `:froyo`, `:gingerbread`, `:honeycomb`, `:ice_cream_sandwich`, `:jelly_bean`, `:kitkat`, `:lollipop`, `:marshmallow`, `:nougat`, `:oreo`, `:pie`

Since android version releases follow the alphabet and since every new version since android `5` is contained within a single major version number,
additional methods are defined for all "future" android releases e.g:

```ruby
label :android_p, for: :android, version: '9'..'9.9.9'
label :android_q, for: :android, version: '10'..'10.9.9'
# ... snipped ...
label :android_y, for: :android, version: '18'..'18.9.9'
label :android_z, for: :android, version: '19'..'19.9.9'
```

So for every unreleased version of android, you can identify it by using `:android_` followed by the letter for that version: `client.android_p?`.
Since some android versions are already known, this system is supported from the letter `p` up to and including `z`.

#### Windows

Regular: `:windows`

`:dos`, `:windows98`, `:windows2000`, `:xp`, `:vista`, `:windows7`, `:windows8`, `:windows10`

**NOTE:** Windows 10 will be the last major version bump for Windows (for now, at least).

#### Macintosh

Regular: `:macintosh`

`:cheetah`, `:puma`, `:jaguar`, `:panther`, `:tiger`, `:leopard`, `:snow_leopard`, `:lion`, `:mountain_lion`, `:mavericks`, `:yosemite`, `:el_capitan`, `:sierra`, `:high_sierra`, `:mojave`

**NOTE:** macOS version 10 and up increment the _minor version_ instead of the _major version_ in a new major release.

### Devices

Finally, Browserino can also detect devices in addition to the above.

`htc`, `kindle`, `alcatel`, `appletv`, `iphone`, `ipad`, `archos`, `asus`, `zte`, `blackberry`, `oneplus`, `lenovo`, `nokia`, `motorola`, `huawei`, `nexus`, `hp`, `lg`, `dell`, `oppo`
