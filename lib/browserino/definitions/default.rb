Browserino.define do
  before_parse do |s|
    s.gsub! %r{(Mozilla/[\d\.]+)}i, ''
    s.gsub! %r{9\.80}, '' if %r{opera}i.match? s
    s.gsub! %r{(?:apple)?webkit/[\d\.]+}i, '' if %r{presto}i.match? s
    s.gsub! %r{(?:ms)?ie}i, '' if %r{rv:}i.match? s
    s.gsub! %r{android|linux}i, '' if %r{tizen}i.match? s
    s.gsub! %r{linux}i, '' if %r{android|s(?:unos|olaris)|w(?:eb)?os}i.match? s
    s.gsub! %r{x11}i, '' if %r{bsd|s(?:unos|olaris)}i.match? s
    s.gsub! %r{windows\snt}i, '' if %r{windows\sphone}i.match? s
  end

  format_all do |value|
    value.to_s.downcase.strip.tr ' ', '_'
  end

  formatter :system_name do |system_name|
    system_name = 'ios'     if %r{ip(?:[ao]d|hone)}.match? system_name
    system_name = 'webos'   if %r{w(?:eb)?os}.match? system_name
    system_name = 'linux'   if %r{ubuntu|x11}.match? system_name
    system_name = 'solaris' if %r{s(?:unos|olaris)}.match? system_name
    system_name
  end

  formatter :architecture do |arch|
    (%r{(?:x86_|amd|wow)?64}.match?(arch) && 'x64') || 'x32'
  end

  formatter :version, :engine_version, :system_version do |version|
    version.split(/[\._]/)[0..2].join('.')
  end

  always do
    locale         %r{\s(\w{2}(?:\-\w{2})?)[;\)]}i
    architecture   %r{((?:(?:x|x86_|amd|wow)64)|i[36]86)}i
    system_name    %r{(windows(?:\sphone(?:\sos)?)?|macintosh|android|tizen
                      |ip(?:[ao]d|hone)|blackberry|linux|ubuntu|x11|bsd
                      |s(?:unos|olaris)|w(?:eb)?os)}xi
    system_version %r{(?:windows(?:\sphone(?:\sos)?)?|nt|mac\sos\sx|android
                      |(?:cpu\s|ip(?:[ao]d|hone)\s)os|blackberry.*?version/|bb
                      |s(?:unos|olaris)/?|w(?:eb)?os/|tizen)\s?([\d\._]+)}xi
  end

  # colibri: { name: /(?<name>colibri)/i,
  #            version: %r{colibri/(?<version>[\d\.]+)}i },

  match %r{colibri}i do
    name :colibri
    type :browser

    collect do
      version        %r{colibri/([\d\.]+)}i
      engine         %r{(webkit)}i
      engine_version %r{webkit/([\d\.]+)}i
    end
  end

  match %r{msie|trident}i do
    name :ie
    type :browser

    collect do
      version        %r{(?:(?:ms)?ie\s|rv:)([\d\.]+)}i
      engine         %r{trident}i
      engine_version %r{trident/([\d\.]+)}i
    end
  end

  match %r{chrome(?:ium)?}i do
    name :chrome
    type :browser

    collect do
      version        %r{chrome(?:ium)?/([\d\.]+)}i
      engine         %r{(webkit|blink)}i
      engine_version %r{webkit|blink/([\d\.]+)}i
    end
  end

  match %r{safari}i do
    name :safari
    type :browser

    collect do
      version        %r{(?:safari|version)/([\d\.]+)}i
      engine         %r{(webkit)}i
      engine_version %r{webkit/([\d\.]+)}i
    end
  end

  match %r{firefox}i do
    name :firefox
    type :browser

    collect do
      version        %r{firefox/([\d\.]+)}i
      engine         %r{(gecko|servo)}i
      engine_version %r{rv:\s?([\d\.]+)}i
    end
  end

  match_alias /seamonkey/i, name: :seamonkey, to: :firefox

  match %r{googlebot}i,           name: :google,              type: :bot
  match %r{yahoo\!\sslurp}i,      name: :yahoo_slurp,         type: :bot
  match %r{msnbot}i,              name: :msn,                 type: :bot
  match %r{bingbot}i,             name: :bing,                type: :bot
  match %r{baiduspider}i,         name: :baiduspider,         type: :bot
  match %r{yandexbot}i,           name: :yandex,              type: :bot
  match %r{sosospider}i,          name: :sosospider,          type: :bot
  match %r{exabot}i,              name: :exa,                 type: :bot
  match %r{sogou\s?spider}i,      name: :sogou_spider,        type: :bot
  match %r{nutch}i,               name: :nutch,               type: :bot
  match %r{scrapy}i,              name: :scrapy,              type: :bot
  match %r{dataparksearch}i,      name: :dataparksearch,      type: :bot
  match %r{holmes}i,              name: :holmes,              type: :bot
  match %r{(?:ask)\sjeeves}i,     name: :ask,                 type: :bot
  match %r{duckduckgo}i,          name: :duckduckgo,          type: :bot
  match %r{beslistbot}i,          name: :beslist,             type: :bot
  match %r{twitterbot}i,          name: :twitter,             type: :bot
  match %r{linkedinbot}i,         name: :linkedin,            type: :bot
  match %r{instagram}i,           name: :instagram,           type: :bot
  match %r{pinterest}i,           name: :pinterest,           type: :bot
  match %r{tumblr}i,              name: :tumblr,              type: :bot
  match %r{ia_archiver}i,         name: :alexa,               type: :bot
  match %r{4anything}i,           name: :four_anything,       type: :bot
  match %r{autoemailspider}i,     name: :auto_email_spider,   type: :bot
  match %r{boston[_ ]project}i,   name: :boston_project,      type: :bot
  match %r{atomz}i,               name: :atomz,               type: :bot
  match %r{atomic_email_hunter}i, name: :atomic_email_hunter, type: :bot
  match %r{altavista}i,           name: :altavista,           type: :bot
  match %r{alkaline}i,            name: :alkaline,            type: :bot
  match %r{acoi}i,                name: :acoi,                type: :bot
  match %r{acoon}i,               name: :acoon,               type: :bot
  match %r{accoona}i,             name: :accoona,             type: :bot
  match %r{face(?:bookexternalhit|bot)}i, name: :facebook,    type: :bot
end
