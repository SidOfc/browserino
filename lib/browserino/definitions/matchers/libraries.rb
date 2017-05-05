# frozen_string_literal: true

# automatically set type to :library for each defined matcher
# additionally, set text to true to each of the matchers automatically
Browserino.config.libraries text: true do
  match %r{Go-http-client}i, name: :golang, version: %r{-client/([\d\.]+)}i
  match %r{python}i,         name: :python, version: %r{-urllib/([\d\.]+)}i
  match %r{luakit}i,         name: :luakit, engine: :webkit
  match %r{webfetch}i,       name: :webfetch
  match %r{pycurl}i,         name: :pycurl
  match %r{perl}i,           name: :perl
  match %r{java}i,           name: :java
  match %r{curl}i,           name: :curl
  match %r{wget}i,           name: :wget
  match %r{php}i,            name: :php
end
