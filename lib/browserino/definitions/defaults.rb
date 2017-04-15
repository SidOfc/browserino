# frozen_string_literal: true
Browserino.define do
  match do
    locale         %r{\s(\w{2}(?:\-\w{2})?)[;\)]}i
    system_arch    %r{((?:(?:x|x86_|amd|wow|win)64)|i[36]86)}i
    system_name    %r{(windows(?:\sphone)?|macintosh|android|tizen
                      |ip(?:[ao]d|hone)|blackberry|linux|ubuntu|x11|bsd
                      |s(?:unos|olaris)|w(?:eb)?os)}xi
    system_version %r{(?:windows(?:\sphone(?:\sos)?)?|nt|mac\sos\sx|android
                      |(?:cpu\s|ip(?:[ao]d|hone)\s)os|blackberry|bb
                      |s(?:unos|olaris)/?|w(?:eb)?os/|tizen)\s?([\d\._]+)}xi
  end

  browsers do
    match %r{maxthon}i do
      name           :maxthon
      type           :browser

      version        %r{maxthon[/\s]([\d\.]+)}i
      engine_name    %r{(webkit|presto|gecko|trident)}i
      engine_version %r{(?:webkit|presto|gecko|trident)/([\d\.]+)}i
    end

    match %r{ucbrowser}i do
      name           :ucbrowser

      version        %r{ucbrowser/?([\d\.]+)}i
      engine_name    %r{(trident|gecko|webkit|presto)}i
      engine_version %r{(?:trident|gecko|webkit|presto)/([\d\.]+)}i
    end

    match %r{edge}i do
      name           :edge
      engine_name    :edgehtml
      modern?        true

      engine_version %r{edge/([\d\.]+)}i
    end

    match %r{ope?ra?\smini}i do
      name           :opera_mini

      version        %r{ope?ra?\smini/([\d\.]+)}i
      engine_name    %r{(presto|webkit)}i
      engine_version %r{(?:presto|webkit)/([\d\.]+)}i
    end

    match %r{opera[^\w]}i do
      name           :opera

      version        %r{(?:opera[\s/]|version/)([\d\.]+)}i
      engine_name    %r{(presto|webkit)}i
      engine_version %r{(?:presto|webkit)/([\d\.]+)}i
    end

    match %r{msie|trident}i do
      name           :ie
      engine_name    :trident

      version        %r{(?:(?:ms)?ie\s|rv:)([\d\.]+)}i
      engine_version %r{trident/([\d\.]+)}i

      modern?        { version >= 10 }
    end

    match %r{chrome(?:ium)?}i do
      name           :chrome

      version        %r{chrome(?:ium)?/([\d\.]+)}i
      engine_name    %r{(webkit|blink)}i
      engine_version %r{(?:webkit|blink)/([\d\.]+)}i
    end

    match %r{firefox}i do
      name           :firefox

      version        %r{firefox/([\d\.]+)}i
      engine_name    %r{(gecko|servo)}i
      engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
    end

    match %r{safari}i do
      name           :safari
      engine_name    :webkit

      version        %r{(?:safari|version)/([\d\.]+)}i
      engine_version %r{webkit/([\d\.]+)}i

      modern?        { version >= 9 }
    end
  end

  bots do
    match %r{googlebot}i,                   name: :googlebot
    match %r{yahoo\!\sslurp}i,              name: :yahoo_slurp
    match %r{msnbot}i,                      name: :msn
    match %r{bingbot}i,                     name: :bing
    match %r{baiduspider}i,                 name: :baiduspider
    match %r{yandexbot}i,                   name: :yandex
    match %r{sosospider}i,                  name: :sosospider
    match %r{exabot}i,                      name: :exa
    match %r{sogou\s?spider}i,              name: :sogou_spider
    match %r{nutch}i,                       name: :nutch
    match %r{scrapy}i,                      name: :scrapy
    match %r{dataparksearch}i,              name: :dataparksearch
    match %r{holmes}i,                      name: :holmes
    match %r{(?:ask)\sjeeves}i,             name: :ask
    match %r{duckduckgo}i,                  name: :duckduckgo
    match %r{beslistbot}i,                  name: :beslist
    match %r{twitterbot}i,                  name: :twitter
    match %r{linkedinbot}i,                 name: :linkedin
    match %r{instagram}i,                   name: :instagram
    match %r{pinterest}i,                   name: :pinterest
    match %r{tumblr}i,                      name: :tumblr
    match %r{ia_archiver}i,                 name: :alexa
    match %r{4anything}i,                   name: :four_anything
    match %r{autoemailspider}i,             name: :auto_email_spider
    match %r{boston[_ ]project}i,           name: :boston_project
    match %r{atomz}i,                       name: :atomz
    match %r{atomic_email_hunter}i,         name: :atomic_email_hunter
    match %r{altavista}i,                   name: :altavista
    match %r{alkaline}i,                    name: :alkaline
    match %r{acoi}i,                        name: :acoi
    match %r{acoon}i,                       name: :acoon
    match %r{accoona}i,                     name: :accoona
    match %r{face(?:bookexternalhit|bot)}i, name: :facebook
  end

  like :chrome do
      match %r{brave}i,   name: :brave,   version: %r{brave/([\d\.]+)}i
      match %r{vivaldi}i, name: :vivaldi, version: %r{vivaldi/([\d\.]+)}i
      match %r{colibri}i, name: :colibri, version: %r{colibri/([\d\.]+)}i
      match %r{bolt}i,    name: :bolt,    version: %r{bolt/([\d\.]+)}i

      match %r{samsungbrowser}i, name: :samsungbrowser,
                                 version: %r{samsungbrowser/([\d\.]+)}i

      match %r{webos|wosbrowser}i,
            name: :webosbrowser,
            version: %r{(?:version|w(?:eb)?osbrowser)/([\d\.]+)}i
  end

  like :firefox do
    match %r{seamonkey}i, name: :seamonkey, version: %r{seamonkey/([\d\.]+)}i
    match %r{superswan}i, name: :superswan, version: %r{superswan/([\d\.]+)}i
  end
end
