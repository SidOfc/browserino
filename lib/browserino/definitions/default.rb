Browserino.define do
  match do
    locale         %r{\s(\w{2}(?:\-\w{2})?)[;\)]}i
    system_arch    %r{((?:(?:x|x86_|amd|wow|win)64)|i[36]86)}i
    system_name    %r{(windows(?:\sphone)?|macintosh|android|tizen
                      |ip(?:[ao]d|hone)|blackberry|linux|ubuntu|x11|bsd
                      |s(?:unos|olaris)|w(?:eb)?os)}xi
    system_version %r{(?:windows(?:\sphone(?:\sos)?)?|nt|mac\sos\sx|android
                      |(?:cpu\s|ip(?:[ao]d|hone)\s)os|blackberry.*?version/|bb
                      |s(?:unos|olaris)/?|w(?:eb)?os/|tizen)\s?([\d\._]+)}xi
  end

  match %r{maxthon}i do
    name           :maxthon
    type           :browser

    version        %r{maxthon/([\d\.]+)}i
    engine_name    %r{(webkit|presto|gecko|trident)}i
    engine_version %r{(?:webkit|presto|gecko|trident)/([\d\.]+)}i
  end

  match %r{ucbrowser}i do
    name           :ucbrowser
    type           :browser

    version        %r{ucbrowser/?([\d\.]+)}i
    engine_name    %r{(trident|gecko|webkit|presto)}i
    engine_version %r{(?:trident|gecko|webkit|presto)/([\d\.]+)}i
  end

  match %r{edge}i do
    name           :edge
    type           :browser
    engine_name    :edgehtml

    version        %r{edge/([\d\.]+)}i
    engine_version %r{edge/([\d\.]+)}i
  end

  match %r{ope?ra?\smini}i do
    name           :opera_mini
    type           :browser

    version        %r{ope?ra?\smini/([\d\.]+)}i
    engine_name    %r{(presto|webkit)}i
    engine_version %r{(?:presto|webkit)/([\d\.]+)}i
  end

  match %r{opera[^\w]}i do
    name           :opera
    type           :browser

    version        %r{(?:opera|version)/([\d\.]+)}i
    engine_name    %r{(presto|webkit)}i
    engine_version %r{(?:presto|webkit)/([\d\.]+)}i
  end

  match %r{msie|trident}i do
    name           :ie
    type           :browser
    engine_name    :trident

    version        %r{(?:(?:ms)?ie\s|rv:)([\d\.]+)}i
    engine_version %r{trident/([\d\.]+)}i
  end

  match %r{chrome(?:ium)?}i do
    name           :chrome
    type           :browser

    version        %r{chrome(?:ium)?/([\d\.]+)}i
    engine_name    %r{(webkit|blink)}i
    engine_version %r{(?:webkit|blink)/([\d\.]+)}i
  end

  match %r{firefox}i do
    name           :firefox
    type           :browser

    version        %r{firefox/([\d\.]+)}i
    engine_name    %r{(gecko|servo)}i
    engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
  end

  match %r{safari}i do
    name           :safari
    type           :browser
    engine_name    :webkit

    version        %r{(?:safari|version)/([\d\.]+)}i
    engine_version %r{webkit/([\d\.]+)}i
  end

  match %r{googlebot}i,                   name: :google,              type: :bot
  match %r{yahoo\!\sslurp}i,              name: :yahoo_slurp,         type: :bot
  match %r{msnbot}i,                      name: :msn,                 type: :bot
  match %r{bingbot}i,                     name: :bing,                type: :bot
  match %r{baiduspider}i,                 name: :baiduspider,         type: :bot
  match %r{yandexbot}i,                   name: :yandex,              type: :bot
  match %r{sosospider}i,                  name: :sosospider,          type: :bot
  match %r{exabot}i,                      name: :exa,                 type: :bot
  match %r{sogou\s?spider}i,              name: :sogou_spider,        type: :bot
  match %r{nutch}i,                       name: :nutch,               type: :bot
  match %r{scrapy}i,                      name: :scrapy,              type: :bot
  match %r{dataparksearch}i,              name: :dataparksearch,      type: :bot
  match %r{holmes}i,                      name: :holmes,              type: :bot
  match %r{(?:ask)\sjeeves}i,             name: :ask,                 type: :bot
  match %r{duckduckgo}i,                  name: :duckduckgo,          type: :bot
  match %r{beslistbot}i,                  name: :beslist,             type: :bot
  match %r{twitterbot}i,                  name: :twitter,             type: :bot
  match %r{linkedinbot}i,                 name: :linkedin,            type: :bot
  match %r{instagram}i,                   name: :instagram,           type: :bot
  match %r{pinterest}i,                   name: :pinterest,           type: :bot
  match %r{tumblr}i,                      name: :tumblr,              type: :bot
  match %r{ia_archiver}i,                 name: :alexa,               type: :bot
  match %r{4anything}i,                   name: :four_anything,       type: :bot
  match %r{autoemailspider}i,             name: :auto_email_spider,   type: :bot
  match %r{boston[_ ]project}i,           name: :boston_project,      type: :bot
  match %r{atomz}i,                       name: :atomz,               type: :bot
  match %r{atomic_email_hunter}i,         name: :atomic_email_hunter, type: :bot
  match %r{altavista}i,                   name: :altavista,           type: :bot
  match %r{alkaline}i,                    name: :alkaline,            type: :bot
  match %r{acoi}i,                        name: :acoi,                type: :bot
  match %r{acoon}i,                       name: :acoon,               type: :bot
  match %r{accoona}i,                     name: :accoona,             type: :bot
  match %r{face(?:bookexternalhit|bot)}i, name: :facebook,            type: :bot

  match %r{bolt}i, like: :safari, name: :bolt, version: %r{bolt/([\d\.]+)}i
  match %r{brave}i, like: :chrome, name: :brave, version: %r{brave/([\d\.]+)}i

  match %r{vivaldi}i, like: :chrome, name: :vivaldi,
                      version: %r{vivaldi/([\d\.]+)}i

  match %r{samsungbrowser}i, like: :chrome, name: :samsungbrowser,
                             version: %r{samsungbrowser/([\d\.]+)}i

  match %r{seamonkey}i, like: :firefox, name: :seamonkey,
                        version: %r{seamonkey/([\d\.]+)}i

  match %r{superswan}i, like: :firefox, name: :superswan,
                        version: %r{superswan/([\d\.]+)}i

  match %r{colibri}i, like: :chrome, name: :colibri,
                      version: %r{colibri/([\d\.]+)}i

  match %r{webos|wosbrowser}i,
        like: :chrome, name: :webosbrowser,
        version: %r{(?:version|w(?:eb)?osbrowser)/([\d\.]+)}i
end
