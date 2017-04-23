# frozen_string_literal: true
Browserino.config.define do
  # a set of global matchers that will use formatted properties found earlier
  # they will also be applied to every matcher unless that matcher has it's own
  # property set for the defined smart matcher
  smart_match :version,        with: ':name/([\d\._]+)',   flags: [:i]
  smart_match :engine_version, with: ':engine/([\d\._]+)', flags: [:i]

  # a simple set of global matchers that will be merged
  # with an identity the final client object is created
  match do
    locale           %r{(?<!nintendo)[;\s](\w{2}(?:\-\w{2})?)[;)]}i
    architecture     %r{((?:(?:x|x86_|amd|wow|win)64)|i[36]86)}i
    mobile           %r{(bolt|nokia|samsung(?!b)|mobi(?:le)?|i?p(?:[ao]d|hone)
                        |android|bb\d+|blackberry|iemobile|fennec|bada|meego
                        |tizen|vodafone|t\-mobile|opera\sm(?:ob|in)i)}xi
    platform         %r{.*(xbox|wii|nintendo\sds|playstation|windows(?:\sphone)?
                        |macintosh|mac\sos\sx|android|tizen|ip(?:[ao]d|hone)
                        |blackberry|linux|ubuntu|x11|bsd|s(?:unos|olaris)
                        |w(?:eb)?os)}xi
    platform_version %r{(?:windows(?:\sphone(?:\sos)?)?|nt|mac\sos\sx|android
                      |(?:cpu\s|ip(?:[ao]d|hone)\s)os|blackberry|bb
                      |s(?:unos|olaris)/?|w(?:eb)?os/|tizen)\s?([\d\._]+)}xi
  end

  # automatically set type to :browser for each defined matcher
  browsers do
    # a single matcher that will create an Identity for a specific match
    # identities are added in an array in order of definition - higher is better
    # aliasses are prepended to the list instead of appended (e.g. like blocks)
    # this ensures that aliasses will be matched before any regular matcher
    match %r{maxthon}i do
      # define properties by calling a method with the desired name and:
      #  -- value   # => will create a static method that returns that value
      #  -- /(pat)/ # => will create a method that scans the UA and
      #                  saves the first capture group
      #  -- { blk } # => will create a dynamic method that returns the result
      #                  of the block, it will be executed within an
      #                  instantiated Client object
      name           :maxthon

      version        %r{maxthon[/\s]([\d\.]+)}i
      engine         %r{(webkit|presto|gecko|trident)}i
      engine_version %r{(?:webkit|presto|gecko|trident)/([\d\.]+)}i
    end

    match %r{ucbrowser}i do
      name           :ucbrowser

      version        %r{ucbrowser/?([\d\.]+)}i
      engine         %r{(trident|gecko|webkit|presto)}i
      engine_version %r{(?:trident|gecko|webkit|presto)/([\d\.]+)}i
    end

    match %r{edge}i do
      name           :edge
      engine         :edge
      modern?        true
    end

    match %r{ope?ra?\smini}i do
      name           :opera_mini

      version        %r{ope?ra?\smini/([\d\.]+)}i
      engine         %r{(presto|webkit)}i
      engine_version %r{(?:presto|webkit)/([\d\.]+)}i
    end

    match %r{opera[^\w]}i do
      name           :opera

      version        %r{(?:opera[\s/]|version/)([\d\.]+)}i
      engine         %r{(presto|webkit)}i
      engine_version %r{(?:presto|webkit)/([\d\.]+)}i
    end

    match %r{msie|trident}i do
      name           :ie
      engine         :trident

      version        %r{(?:(?:ms)?ie\s|rv:)([\d\.]+)}i
      modern?        { version >= 10 }
    end

    match %r{chrome(?:ium)?}i do
      name           :chrome

      version        %r{chrome(?:ium)?/([\d\.]+)}i
      engine         %r{(webkit|blink)}i
      engine_version %r{(?:webkit|blink)/([\d\.]+)}i
      modern?        { version >= 50 }
    end

    match %r{firefox}i do
      name           :firefox

      engine         %r{(gecko|servo)}i
      engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
      modern?        { version >= 50 }
    end

    match %r{midori}i do
      name           :midori
      engine         :webkit
    end

    match %r{safari}i do
      name           :safari
      engine         :webkit

      version        %r{(?:safari|version)/([\d\.]+)}i
      modern?        { version >= 9 }
    end
  end

  # automatically set type to :bot for each defined matcher
  bots do
    match %r{googlebot}i,                   name: :googlebot
    match %r{yahoo\!\sslurp}i,              name: :yahoo_slurp
    match %r{msnbot}i,                      name: :msnbot
    match %r{bingbot}i,                     name: :bingbot
    match %r{baiduspider}i,                 name: :baiduspider
    match %r{yandexbot}i,                   name: :yandexbot
    match %r{sosospider}i,                  name: :sosospider
    match %r{exabot}i,                      name: :exabot
    match %r{sogou\s?spider}i,              name: :sogou_spider
    match %r{nutch}i,                       name: :nutch
    match %r{scrapy}i,                      name: :scrapy
    match %r{dataparksearch}i,              name: :dataparksearch
    match %r{holmes}i,                      name: :holmes
    match %r{(?:ask)\sjeeves}i,             name: :ask
    match %r{duckduckgo}i,                  name: :duckduckgo
    match %r{beslistbot}i,                  name: :beslistbot
    match %r{twitterbot}i,                  name: :twitterbot
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
    match %r{alkaline}i,                    name: :alkalinebot
    match %r{acoi}i,                        name: :acoi
    match %r{acoon}i,                       name: :acoon
    match %r{accoona}i,                     name: :accoona
    match %r{face(?:bookexternalhit|bot)}i, name: :facebook
    match %r{linkdexbot}i,                  name: :linkdexbot
    match %r{aitcsrobot}i,                  name: :aitcsrobot
    match %r{alexibot}i,                    name: :alexibot
    match %r{aqua_products}i,               name: :aqua_products
    match %r{arachnophilia}i,               name: :arachnophilia
    match %r{aspider}i,                     name: :aspider
    match %r{asterias}i,                    name: :asterias
    match %r{auresys}i,                     name: :auresys
    match %r{b2w}i,                         name: :b2w
    match %r{backdoorbot}i,                 name: :backdoorbot
    match %r{backrub}i,                     name: :backrub
    match %r{big\sbrother}i,                name: :big_brother
    match %r{bizbot}i,                      name: :bizbot
    match %r{black\shole}i,                 name: :black_hole
    match %r{blackwidow}i,                  name: :blackwidow
    match %r{blexbot}i,                     name: :blexbot
    match %r{bspider}i,                     name: :bspider
    match %r{bullseye}i,                    name: :bullseye
    match %r{emailcollector}i,              name: :emailcollector
    match %r{emailsiphon}i,                 name: :emailsiphon
    match %r{emailwolf}i,                   name: :emailwolf
    match %r{ecatch}i,                      name: :ecatch
    match %r{flaming\sattackbot}i,          name: :flaming_attackbot
    match %r{getright}i,                    name: :getright
    match %r{harvest}i,                     name: :harvest
    match %r{huaweisymantecspider}i,        name: :huaweisymantecspider

    match %r{safetynet\srobot}i, name: :safetynet_robot,
                                 version: %r{safetynet\srobot\s([\d\.]+)}i
    match %r{go\!zilla}i,        name: :gozilla,
                                 version: %r{go\!zilla\s([\d\.]+)}i
    match %r{download\sdemon}i,  name: :download_demon,
                                 version: %r{download\sdemon/([\d\.]+)}i
  end

  # automatically set type to :library for each defined matcher
  libraries do
    match %r{php}i,    name: :php
    match %r{python}i, name: :python, version: %r{-urllib/([\d\.]+)}i
    match %r{perl}i,   name: :perl
    match %r{java}i,   name: :java
    match %r{pycurl}i, name: :pycurl
    match %r{curl}i,   name: :curl
  end

  # inherit properties a standard set of properties by the name of a
  # previously defined matcher, overwritten by properties added within matchers
  # inherit properties from Identity where name == :chrome
  like :chrome do
    match %r{brave}i,    name: :brave,    version: %r{brave/([\d\.]+)}i
    match %r{vivaldi}i,  name: :vivaldi,  version: %r{vivaldi/([\d\.]+)}i
    match %r{colibri}i,  name: :colibri,  version: %r{colibri/([\d\.]+)}i
    match %r{rockmelt}i, name: :rockmelt, version: %r{rockmelt/([\d\.]+)}i
  end

  # inherit properties from Identity where name == :safari
  like :safari do
    match %r{bolt}i,           name: :bolt, version: %r{bolt/([\d\.]+)}i
    match %r{samsungbrowser}i, name: :samsungbrowser,
                               version: %r{samsungbrowser/([\d\.]+)}i

    match %r{webos|wosbrowser}i,
          name: :webosbrowser,
          version: %r{(?:version|w(?:eb)?osbrowser)/([\d\.]+)}i
  end

  # inherit properties from Identity where name == :firefox
  like :firefox do
    match %r{prism}i,     name: :prism,     version: %r{prism/([\d\.]+)}i
    match %r{waterfox}i,  name: :waterfox,  version: %r{waterfox/([\d\.]+)}i
    match %r{firebird}i,  name: :firebird,  version: %r{firebird/([\d\.]+)}i
    match %r{netscape}i,  name: :netscape,  version: %r{netscape/([\d\.]+)}i
    match %r{icecat}i,    name: :icecat,    version: %r{icecat/([\d\.]+)}i
    match %r{iceweasel}i, name: :iceweasel, version: %r{iceweasel/([\d\.]+)}i
    match %r{seamonkey}i, name: :seamonkey, version: %r{seamonkey/([\d\.]+)}i
    match %r{superswan}i, name: :superswan, version: %r{superswan/([\d\.]+)}i
  end

  # never thought a browser would want to be like IE...
  like :ie do
    # version does not have to be supplied because we simply want to use
    # the version supplied by the MSIE token instead (there is no version on the avant browser or slimbrowser UA itself)
    match %r{avant\sbrowser}i,    name: :avant_browser
    match %r{slimbrowser}i,       name: :slimbrowser

    match %r{deepnet\sexplorer}i, name: :deepnet_explorer,
                                  version: %r{deepnet\sexplorer ([\d\.]+)}i
  end
end
