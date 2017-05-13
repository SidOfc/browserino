# frozen_string_literal: true

Browserino.config.define do
  # executes before parsing the user agent, 'ua' in this case is the actual
  # user agent string in its full glory. Do manipulations as you wish, I'm
  # using it to successfully strip lies from the user agent and to sometimes
  # simplify a word e.g. 'AppleWebKit' => 'webkit'

  # the returned result will be used as the user agent to parse so make
  # sure to return the final ua at the end
  before_parse do |ua|
    subs = [[%r{applewebkit}i, 'webkit'], [%r{(Mozilla/[\d\.]+)}i, ''],
            [%r{\sAdr\s}, 'Android '], ['X11', '']]
    subs << [%r{Chrome|Safari}, ''] if ua =~ %r{[Nn]ichrome}
    subs << [%r{9\.80}, ''] if ua =~ %r{opera}i
    subs << [%r{webkit/}i, ''] if ua =~ %r{presto}i
    subs << [%r{android|linux}i, ''] if ua =~ %r{tizen|windows\sphone}i
    subs << [%r{linux}i, ''] if ua =~ %r{android|s(unos|olaris)|w(eb)?os}i
    subs << [%r{windows\snt}i, ''] if ua =~ %r{windows\sphone}i
    subs << [%r{Windows\s\d+}, 'windows'] if ua =~ %r{^ice\sbrowser}i
    subs << [%r{rv:}i, ''] if ua =~ %r{servo}i
    subs << [%r{mac\sos\sx|macintosh}i, ''] if ua =~ %r{ip(?:[ao]d|hone)|fxos}i
    subs << [%r{msie}i, ''] if ua =~ %r{huaweisymantecspid|surf|\w*bot
                                        |windows-rss|yahoo(?:se)?}xi
    subs << [%r{risc\sos}i, 'risc'] if ua =~ %r{risc\sos}i
    subs << [%r{msie|windows}i, ''] if ua =~ %r{dts\sagent}i
    subs << [%r{blade\sos}i, 'blade-os'] if ua =~ %r{future\sstar}i
    subs << [%r{awesomium}i, ''] if ua =~ %r{flashfire}i
    subs << [%r{firefox}i, ''] if ua =~ %r{ips-agent}i
    subs << [%r{newsgator}i, ''] if ua =~ %r{newswire}i

    subs.reduce(ua) { |acc, elem| acc.gsub(*elem) }
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
    when %r{\A[\d_\.]+\z}i                     then val.to_s.strip.tr '_', '.'
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
    if %r{ip(?:[ao]d|hone)}i =~ val    then :ios
    elsif %r{^symbian$}i =~ val        then :symbianos
    elsif %r{w(?:eb)?os}i =~ val       then :webos
    elsif %r{ubuntu|debian}i =~ val    then :linux
    elsif %r{mac_os_x}i =~ val         then :macintosh
    elsif %r{s(?:unos|olaris)}i =~ val then :solaris
    elsif %r{cros}i =~ val             then :chromeos
    elsif %r{kindle|kf\w+}i =~ val     then :fire_os
    elsif %r{fxos}i =~ val             then :firefox_os
    else val
    end
  end

  filter :device do |val|
    if %r{kf\w*}i =~ val                              then :kindle
    elsif %r{lg[-l_]}i =~ val                         then :lg
    elsif %r{\w+tab}i =~ val                          then :lenovo
    elsif %r{lumia}i =~ val                           then :nokia
    elsif %r{^moto}i =~ val                           then :motorola
    elsif %r{\d+dl|venue}i =~ val                     then :dell
    elsif %r{me\d+x|a\df;|transformer|slider}i =~ val then :asus
    else val
    end
  end

  filter :architecture do |val|
    val = :x64 if val && val != :arm && val =~ %r{(?:x86_|amd|wow)?64|i686}i
    val = :x32 if val && !%i[arm x64].include?(val)
    val
  end

  filter :mobile, :tablet, :smarttv, :bad do |value|
    !value.to_s.strip.empty?
  end
end
