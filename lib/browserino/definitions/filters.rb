# frozen_string_literal: true

Browserino.config.define do
  # executes before parsing the user agent, 's' in this case is the actual
  # user agent string in full glory. Do manipulations as you wish, I'm
  # using it to successfully strip lies from the user agent and to sometimes
  # simplify a word e.g. 'AppleWebKit' => 'webkit'

  # the returned result will be used as the user agent to parse so make
  # sure to return the final ua at the end
  before_parse do |ua|
    ua = ua.gsub(%r{applewebkit}i, 'webkit').gsub %r{(Mozilla/[\d\.]+)}i, ''
    ua = ua.gsub(%r{chrome|safari}i, '').gsub('OPR', 'opera') if ua =~ %r{OPR}
    ua = ua.gsub %r{9\.80}, '' if ua =~ %r{opera}i
    ua = ua.gsub %r{webkit/}i, '' if ua =~ %r{presto}i
    ua = ua.gsub %r{(?:ms)?ie}i, '' if ua =~ %r{rv:}i
    ua = ua.gsub %r{android|linux}i, '' if ua =~ %r{tizen}i
    ua = ua.gsub %r{linux}i, '' if ua =~ %r{android|s(unos|olaris)|w(eb)?os}i
    ua = ua.gsub %r{x11}i, '' if ua =~ %r{bsd|s(unos|olaris)}i
    ua = ua.gsub %r{windows\snt}i, '' if ua =~ %r{windows\sphone}i
    ua = ua.gsub %r{rv:}i, '' if ua =~ %r{servo}i
    ua = ua.gsub %r{mac\sos\sx}i, '' if ua =~ %r{ip(?:[ao]d|hone)}i
    ua = ua.gsub %r{msie}i, '' if ua =~ %r{huaweisymantecspider}i
    ua = ua.gsub %r{risc\sos}i, 'risc' if ua =~ %r{risc\sos}i
    ua = ua.gsub %r{msie}i, '' if ua =~ %r{surf}i
    ua = ua.gsub %r{safari}i, 'chrome' if ua =~ %r{bluechrome}i
    ua
  end

  # after a matcher is found, it's values are filtered in two stages
  # first, filters will parse all statically defined values (e.g.) no regexp
  # or block within matchers, after that, smart matcher patterns will be
  # conditionally added and parsed with the previously collected values and
  # then also filtered

  # this is a global filter, multiple can be defined and they will all run
  # before any named filters
  filter do |val|
    case val
    when TrueClass, FalseClass, NilClass, Proc then val
    when %r{\A[\d_\.]+\z}i then val.to_s.strip.tr('_', '.')
    else val.to_s.downcase.strip.gsub(%r{[\s-]+}i, '_').to_sym
    end
  end

  # this is a named filter, it defines the same filter for 3 properties
  # multiple name filters for the same property can be created, they will be
  # executed in order of addition
  filter :version, :engine_version, :platform_version do |val|
    Browserino::Version.new val
  end

  filter :platform do |val|
    val = :ios       if val =~ %r{ip(?:[ao]d|hone)}i
    val = :webos     if val =~ %r{w(?:eb)?os}i
    val = :linux     if val =~ %r{ubuntu|x11}i
    val = :solaris   if val =~ %r{s(?:unos|olaris)}i
    val = :macintosh if val =~ %r{mac_os_x}i
    val
  end

  filter :architecture do |val|
    val = :x64 if val && val != :arm && val =~ %r{(?:x86_|amd|wow)?64|i686}i
    val = :x32 if val && !%i[arm x64].include?(val)
    val
  end

  filter :mobile do |value|
    !value.to_s.strip.empty?
  end
end
