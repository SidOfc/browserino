# frozen_string_literal: true
Browserino.config.define do
  # executes before parsing the user agent, 's' in this case is the actual
  # user agent string in full glory. Do manipulations as you wish, I'm
  # using it to successfully strip lies from the user agent and to sometimes
  # simplify a word e.g. 'AppleWebKit' => 'webkit'

  # the string does not have to be returned as it will not be assigned to the
  # result of this block, use destructive(!) methods instead!
  before_parse do |s|
    s.gsub! %r{applewebkit}i, 'webkit'
    s.gsub! %r{(Mozilla/[\d\.]+)}i, ''

    s.gsub!(%r{chrome|safari}i, '').gsub!('OPR', 'opera') if %r{OPR}.match? s
    s.gsub! %r{9\.80}, '' if %r{opera}i.match? s
    s.gsub! %r{webkit/}i, '' if %r{presto}i.match? s
    s.gsub! %r{(?:ms)?ie}i, '' if %r{rv:}i.match? s
    s.gsub! %r{android|linux}i, '' if %r{tizen}i.match? s
    s.gsub! %r{linux}i, '' if %r{android|s(?:unos|olaris)|w(?:eb)?os}i.match? s
    s.gsub! %r{x11}i, '' if %r{bsd|s(?:unos|olaris)}i.match? s
    s.gsub! %r{windows\snt}i, '' if %r{windows\sphone}i.match? s
    s.gsub! %r{rv:}i, '' if %r{servo}i.match? s
  end

  # after an identity is found, it's values are filtered in two stages
  # first, filters will parse all statically defined values (e.g.) no regexp
  # or block within matchers, after that, smart matcher patterns will be
  # conditionally added and parsed with the previously collected values and
  # then also filtered

  # this is a global filter, multiple can be defined and they will all run
  # before any named filters
  filter do |value|
    case value
    when TrueClass, FalseClass, NilClass, Proc then value
    when %r{\A[\d_\.]+\z}i then value.to_s.strip.tr('_', '.')
    else value.to_s.downcase.strip.gsub(%r{[\s-]+}i, '_').to_sym
    end
  end

  # this is a named filter, it defines the same filter for 3 properties
  # multiple name filters for the same property can be created, they will be
  # executed in order of addition
  filter :version, :engine_version, :platform_version do |value|
    Browserino::Version.new value
  end

  filter :platform do |value|
    value = :ios     if %r{ip(?:[ao]d|hone)}.match? value
    value = :webos   if %r{w(?:eb)?os}.match? value
    value = :linux   if %r{ubuntu|x11}.match? value
    value = :solaris if %r{s(?:unos|olaris)}.match? value
    value
  end

  filter :architecture do |value|
    value = :x64 if value && %r{(?:x86_|amd|wow)?64|i686}i.match?(value)
    value = :x32 if value && value != :x64
    value
  end

  filter :mobile do |value|
    !value.to_s.strip.empty?
  end
end
