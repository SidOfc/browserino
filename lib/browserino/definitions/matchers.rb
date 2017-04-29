# frozen_string_literal: true

Browserino.config.define do
  # Aside from the logic going on in this file, the order in which things are
  # written is important! If you would move the :midori matcher below the
  # :safari matcher and you would run rspec, you would see failures due to
  # the change in order. The order can be changed - no problem,
  # as long as the tests keep running

  # a set of global matchers that will use formatted properties found earlier
  # they will also be applied to every matcher unless that matcher has it's own
  # (or inherited a property through like) property set up for
  # the defined smart matcher
  smart_match :version,        with: ':name[\s/]?v?([\d\._]+)', flags: [:i]
  smart_match :engine_version, with: ':engine[\s/]?([\d\._]+)', flags: [:i]

  # a simple set of global matchers that will be merged and scanned
  # with a specific matcher when the final client object is created
  match do
    locale           %r{(?<!nintendo)[;\s(]([a-z]{2}(?:[-_][a-z]{2})?)[;)]}i
    architecture     %r{((?:(?:x|x86_|amd|wow|win)64)|i[36]86|arm)}i

    mobile           %r{(bolt|nokia|samsung(?!b)|mobi(?:le)?|i?p(?:[ao]d|hone)
                        |android|bb\d+|blackberry|iemobile|fennec|bada|meego
                        |tizen|vodafone|t\-mobile|kindle|kf\w\w
                        |opera\sm(?:ob|in)i)}xi

    platform         %r{.*(wiiu?|nintendo\sds|playstation|windows(?:\sphone)?
                        |kf\w\w|mac(?:intosh|\sos\sx)|android|ip(?:[ao]d|hone)
                        |blackberry|risc|linux|ubuntu|x11|bsd|s(?:unos|olaris)
                        |tizen|xbox|amigaos|w(?:eb)?os|(?<!mi)cros|kindle)}xi

    platform_version %r{(?:windows(?:\sphone(?:\sos)?)?|nt|android|linux/?
                        |mac\sos\sx(?:\s\w+\s)?|(?:cpu\s|ip(?:[ao]d|hone)\s)os
                        |blackberry|bb|s(?:unos|olaris)/?|w(?:eb)?os/|tizen
                        |risc\s*|amigaos/?|cros\s[\w-]+|ows\sxp)\s?([\d\._]+)}xi
  end

  # automatically set type to :email for each defined matcher
  emails do
    match %r{outlook}i, name: :outlook
    match %r{airmail}i, name: :airmail, engine: :webkit
    match %r{barca}i,   name: :barca,   version: %r{barca(?:pro)?/([\d\.]+)}i

    match %r{ggpht}i do
      name           :gmail
      engine         %r{(trident|gecko|webkit|presto|blink|servo|edge)}i
      engine_version %r{(?:rv:|trident|webkit|presto|blink
                        |servo|edge)[\s/]?([\d\.]+)}i
    end
  end

  # these are the same as above except with engine set to gecko and
  # to look for engine_version using gecko version pattern
  emails engine: :gecko, engine_version: %r{rv:\s?([\d\.]+)}i do
    match %r{thunderbird}i, name: :thunderbird
    match %r{postbox}i,     name: :postbox
  end

  # automatically set type to :browser for each defined matcher
  browsers do
    # a single matcher that will create a matcher for a specific match
    # matchers are added in an array in order of definition - higher is better
    # aliasses are prepended to the list instead of appended (e.g. like blocks)
    # this ensures that aliasses will be matched before any regular matcher
    match %r{maxthon}i do
      # define properties by calling a method with the desired name and:
      #  -- value   # => will create a static method that returns that value
      #  -- /(pat)/ # => will create a method that scans the UA and
      #                  saves the first capture group
      #  -- { blk } # => will create a dynamic method that returns the result
      #                  of the block, it will be executed within an
      #                  instantiated Client object (right after creation)
      name           :maxthon
      engine         %r{(webkit|presto|gecko|trident)}i
    end

    match %r{ucbrowser}i do
      name           :ucbrowser
      engine         %r{(trident|gecko|webkit|presto)}i
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
    end

    match %r{opera[^\w]}i do
      name           :opera
      version        %r{(?:opera[\s/]|version/)([\d\.]+)}i
      engine         %r{(presto|webkit)}i
    end

    # escape has to come before IE
    match %r{escape}i,  name: :escape

    match %r{flock}i,   name: :flock, engine: %r{(webkit|gecko|servo)}i,
                        engine_version: %r{(?:webkit|rv:|servo)[\s/]?([\d\.]+)}i

    match %r{sunrise}i, name: :sunrise, engine: %r{(webkit|gecko|servo)}i,
                        engine_version: %r{(?:webkit|rv:|servo)[\s/]?([\d\.]+)}i

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
      modern?        { version >= 50 }
    end

    match %r{nintendobrowser}i,  name: :nintendobrowser, engine: :webkit
    match %r{deskbrowse}i,       name: :deskbrowse,      engine: :webkit
    match %r{qupzilla}i,         name: :qupzilla,        engine: :webkit
    match %r{midori}i,           name: :midori,          engine: :webkit
    match %r{shiira}i,           name: :shiira,          engine: :webkit
    match %r{amigavoyager}i,     name: :amigavoyager
    match %r{(?<!(?:net))surf}i, name: :surf

    match %r{sundance}i,         name: :sundance,
                                 version: %r{(?:version/|sundance/)([\d\.]+)}i

    match %r{inet\sbrowser}i,    name: :inet_browser, platform: :star_blade_os,
                                 version: %r{browser[\s/]?([\d\.]+)}i

    match %r{ibm\swebexplorer}i, name: :ibm_webexplorer, platform: :os2,
                                 version: %r{bexplorer\s?/v?([\d\.]+)}i

    match %r{element\sbrowser}i, name: :element_browser, engine: :webkit,
                                 version: %r{browser[\s/]([\d\.]+)}i

    match %r{navscape}i,         name: :navscape, engine: :webkit,
                                 version: %r{navscape/(?:\w+-)?([\d\.]+)}i

    match %r{firefox|phoenix}i do
      name           :firefox
      engine         %r{(gecko|servo)}i
      engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
      modern?        { version >= 50 }
    end

    match %r{safari}i do
      name           :safari
      engine         :webkit
      version        %r{(?:safari|version)/([\d\.]+)}i
      modern?        { version >= 9 }
    end

    match %r{epiphany}i,           name: :epiphany,    engine: :webkit
    match %r{uzbl}i,               name: :uzbl,        engine: :webkit
    match %r{roccat}i,             name: :roccat,      engine: :webkit
    match %r{adobeair}i,           name: :adobeair,    engine: :webkit
    match %r{abrowse}i,            name: :abrowse,     engine: :webkit
    match %r{vimprobable}i,        name: :vimprobable, engine: :webkit
    match %r{amaya}i,              name: :amaya,       text: true
    match %r{lynx}i,               name: :lynx,        text: true
    match %r{linemode}i,           name: :linemode,    text: true
    match %r{elinks}i,             name: :elinks,      text: true
    match %r{netpositive}i,        name: :netpositive
    match %r{onebrowser}i,         name: :onebrowser
    match %r{flashfire}i,          name: :flashfire
    match %r{konqueror}i,          name: :konqueror
    match %r{cyberdog}i,           name: :cyberdog
    match %r{hotjava}i,            name: :hotjava
    match %r{netsurf}i,            name: :netsurf
    match %r{contiki}i,            name: :contiki
    match %r{mosaic|ibrowse[^r]}i, name: :mosaic
    match %r{dillo}i,              name: :dillo

    match %r{alienblue}i,      name: :alienblue,
                               version: %r{alienblue(?:hd)?/([\d\.]+)}i

    match %r{obigo}i,          name: :obigo, engine: :webkit,
                               version: %r{obigo/w?([\d\.]+)}i

    match %r{ovibrowser}i,     name: :ovibrowser,  engine: :gecko,
                               engine_version: %r{rv:\s?([\d\.]+)}i

    match %r{osb\-browser}i,   name: :osb_browser, engine: :webkit,
                               version: %r{\-browser/([\d\.]+)}i

    match %r{links}i,          name: :links,
                               version: %r{links\s\(([\d\.]+)}i

    match %r{oregano}i,        name: :oregano,
                               locale: %r{\[(\w{2}(?:\-\w{2})?)\]}i

    match %r{dooble}i,         name: :dooble,   engine: :webkit,
                               locale: %r{\((\w{2}(?:[-_]\w{2})?)\)}i

    match %r{retawq}i,         name: :retawq,   text: true,
                               locale: %r{\[(\w{2}(?:\-\w{2})?)\]}i
  end

  # automatically set type to :bot for each defined matcher
  # additionally, set text to true to each of the matchers automatically
  bots text: true do
    match %r{huaweisymantecspider}i,        name: :huaweisymantecspider
    match %r{atomic_email_hunter}i,         name: :atomic_email_hunter
    match %r{netresearchserver}i,           name: :netresearchserver
    match %r{autoemailspider}i,             name: :auto_email_spider
    match %r{flaming\sattackbot}i,          name: :flaming_attackbot
    match %r{addsugarspiderbot}i,           name: :addsugarspiderbot
    match %r{dataparksearch}i,              name: :dataparksearch
    match %r{boston[_ ]project}i,           name: :boston_project
    match %r{emailcollector}i,              name: :emailcollector
    match %r{4anything}i,                   name: :four_anything
    match %r{aqua_products}i,               name: :aqua_products
    match %r{arachnophilia}i,               name: :arachnophilia
    match %r{emeraldshield}i,               name: :emeraldshield
    match %r{issuecrawler}i,                name: :issuecrawler
    match %r{jaxified\sbot}i,               name: :jaxified_bot
    match %r{stackrambler}i,                name: :stackrambler
    match %r{turnitinbot}i,                 name: :turnitinbot
    match %r{alkaline}i,                    name: :alkalinebot
    match %r{yahoo\!\sslurp}i,              name: :yahoo_slurp
    match %r{emailsiphon}i,                 name: :emailsiphon
    match %r{backdoorbot}i,                 name: :backdoorbot
    match %r{terrawizbot}i,                 name: :terrawizbot
    match %r{searchsight}i,                 name: :searchsight
    match %r{baiduspider}i,                 name: :baiduspider
    match %r{linguee\sbot}i,                name: :linguee_bot
    match %r{sandcrawler}i,                 name: :sandcrawler
    match %r{big\sbrother}i,                name: :big_brother
    match %r{noxtrumbot}i,                  name: :noxtrumbot
    match %r{black\shole}i,                 name: :black_hole
    match %r{blackwidow}i,                  name: :blackwidow
    match %r{sosospider}i,                  name: :sosospider
    match %r{duckduckgo}i,                  name: :duckduckgo
    match %r{beslistbot}i,                  name: :beslistbot
    match %r{twitterbot}i,                  name: :twitterbot
    match %r{linkdexbot}i,                  name: :linkdexbot
    match %r{aitcsrobot}i,                  name: :aitcsrobot
    match %r{litefinder}i,                  name: :litefinder
    match %r{linkwalker}i,                  name: :linkwalker
    match %r{mabontland}i,                  name: :mabontland
    match %r{ahrefsbot}i,                   name: :ahrefsbot
    match %r{mojeekbot}i,                   name: :mojeekbot
    match %r{seznambot}i,                   name: :seznambot
    match %r{girafabot}i,                   name: :girafabot
    match %r{becomebot}i,                   name: :becomebot
    match %r{dts\sagent}i,                  name: :dts_agent
    match %r{emailwolf}i,                   name: :emailwolf
    match %r{googlebot}i,                   name: :googlebot
    match %r{omgilibot}i,                   name: :omgilibot
    match %r{altavista}i,                   name: :altavista
    match %r{yandexbot}i,                   name: :yandexbot
    match %r{newsgator}i,                   name: :newsgator
    match %r{instagram}i,                   name: :instagram
    match %r{pinterest}i,                   name: :pinterest
    match %r{gurujibot}i,                   name: :gurujibot
    match %r{lapozzbot}i,                   name: :lapozzbot
    match %r{mvaclient}i,                   name: :mvaclient
    match %r{ldspider}i,                    name: :ldspider
    match %r{lexxebot}i,                    name: :lexxebot
    match %r{scoutjet}i,                    name: :scoutjet
    match %r{linkedinbot}i,                 name: :linkedin
    match %r{bullseye}i,                    name: :bullseye
    match %r{alexibot}i,                    name: :alexibot
    match %r{face(?:bookexternalhit|bot)}i, name: :facebook
    match %r{getright}i,                    name: :getright
    match %r{asterias}i,                    name: :asterias
    match %r{catchbot}i,                    name: :catchbot
    match %r{discobot}i,                    name: :discobot
    match %r{geniebot}i,                    name: :geniebot
    match %r{koepabot}i,                    name: :koepabot
    match %r{synoobot}i,                    name: :synoobot
    match %r{rufusbot}i,                    name: :rufusbot
    match %r{rampybot}i,                    name: :rampybot
    match %r{mogimogi}i,                    name: :mogimogi
    match %r{jyxobot}i,                     name: :jyxobot
    match %r{orbiter}i,                     name: :orbiter
    match %r{polybot}i,                     name: :polybot
    match %r{accoona}i,                     name: :accoona
    match %r{mj12bot}i,                     name: :mj12bot
    match %r{aspider}i,                     name: :aspider
    match %r{blexbot}i,                     name: :blexbot
    match %r{bspider}i,                     name: :bspider
    match %r{auresys}i,                     name: :auresys
    match %r{bingbot}i,                     name: :bingbot
    match %r{gaisbot}i,                     name: :gaisbot
    match %r{backrub}i,                     name: :backrub
    match %r{harvest}i,                     name: :harvest
    match %r{nymesis}i,                     name: :nymesis
    match %r{radian6}i,                     name: :radian6
    match %r{scrubby}i,                     name: :scrubby
    match %r{snappy}i,                      name: :snappy
    match %r{vortex}i,                      name: :vortex
    match %r{tineye}i,                      name: :tineye
    match %r{sqworm}i,                      name: :sqworm
    match %r{qseero}i,                      name: :qseero
    match %r{pompos}i,                      name: :pompos
    match %r{ichiro}i,                      name: :ichiro
    match %r{bizbot}i,                      name: :bizbot
    match %r{msnbot}i,                      name: :msnbot
    match %r{exabot}i,                      name: :exabot
    match %r{msrbot}i,                      name: :msrbot
    match %r{dotbot}i,                      name: :dotbot
    match %r{cosmos}i,                      name: :cosmos
    match %r{ecatch}i,                      name: :ecatch
    match %r{scrapy}i,                      name: :scrapy
    match %r{holmes}i,                      name: :holmes
    match %r{tumblr}i,                      name: :tumblr
    match %r{mxbot}i,                       name: :mxbot
    match %r{acoon}i,                       name: :acoon
    match %r{nutch}i,                       name: :nutch
    match %r{ia_archiver}i,                 name: :alexa
    match %r{atomz}i,                       name: :atomz
    match %r{acoi}i,                        name: :acoi
    match %r{\sobot}i,                      name: :obot
    match %r{(?:ask)\sjeeves}i,             name: :ask
    match %r{b2w}i,                         name: :b2w

    match %r{oegp}i,                        name: :oegp,
                                            version: %r{v\.\s([\d\.]+)}i

    match %r{ng-search}i,                   name: :ng_search,
                                            version: %r{-search/([\d\.]+)}i

    match %r{morning\spaper}i,              name: :morning_paper,
                                            version: %r{\spaper\s([\d\.]+)}i

    match %r{l\.webis}i,                    name: :lwebis,
                                            version: %r{webis/([\d\.]+)}i

    match %r{covario-ids}i,                 name: :covario_ids,
                                            version: %r{io-ids/([\d\.]+)}i

    match %r{cerberian\sdrtrs}i,            name: :cerberian_drtrs,
                                            version: %r{version[-/]([\d\.]+)}i

    match %r{gigamega}i,                    name: :gigamega,
                                            version: %r{mega\.bot/([\d\.]+)}i

    match %r{sogou(?:\s\w+)?\s?spider}i,    name: :sogou_spider,
                                            version: %r{spider/([\d\.]+)}i

    match %r{megaindex}i,                   name: :megaindex,
                                            version: %r{index\.ru/([\d\.]+)}i

    match %r{mass\sdownloader}i,            name: :mass_downloader,
                                            version: %r{downloader/([\d\.]+)}i

    match %r{safetynet\srobot}i,            name: :safetynet_robot,
                                            version: %r{net\srobot\s([\d\.]+)}i

    match %r{internet\sninja}i,             name: :internet_ninja,
                                            version: %r{ninja\s([\d\.]+)}i

    match %r{go\!zilla}i,                   name: :gozilla,
                                            version: %r{go\!zilla\s([\d\.]+)}i

    match %r{larbin}i,                      name: :larbin,
                                            version: %r{larbin_([\d\.]+)}i

    match %r{download\sdemon}i,             name: :download_demon,
                                            version: %r{demon/([\d\.]+)}i

    match %r{netseer}i,                     name: :netseer,
                                            version: %r{\scrawler/([\d\.]+)}i
  end

  # automatically set type to :validator for each defined matcher
  # additionally, set text to true to each of the matchers automatically
  validators text: true do
    match %r{cse\shtml\svalidator}i, name: :cse_html_validator
    match %r{p3p\svalidator}i,       name: :p3p_validator
    match %r{wdg_validator}i,        name: :wdg_validator
    match %r{w3c_validator}i,        name: :w3c_validator
    match %r{htmlparser}i,           name: :htmlparser
    match %r{csscheck}i,             name: :csscheck

    match %r{cynthia}i,              name: :cynthia,
                                     version: %r{cynthia\s([\d\.]+)}i

    match %r{w3c_css_validator}i,    name: :w3c_css_validator,
                                     version: %r{validator_jfouffa/([\d\.]+)}i
  end

  # automatically set type to :library for each defined matcher
  # additionally, set text to true to each of the matchers automatically
  libraries text: true do
    match %r{Go-http-client}i, name: :golang, version: %r{-client/([\d\.]+)}i
    match %r{python}i,         name: :python, version: %r{-urllib/([\d\.]+)}i
    match %r{webfetch}i,       name: :webfetch
    match %r{pycurl}i,         name: :pycurl
    match %r{perl}i,           name: :perl
    match %r{java}i,           name: :java
    match %r{curl}i,           name: :curl
    match %r{wget}i,           name: :wget
    match %r{php}i,            name: :php
  end

  # inherit properties a standard set of properties by the name of a
  # previously defined matcher, overwritten by properties added within matchers
  # inherit properties from matcher where name == :chrome, (except :version)
  like :chrome, except: [:version] do
    match %r{steam\sgame}i,   name: :steam, version: %r{meoverlay/([\d\.]+)}i
    match %r{comodo_dragon}i, name: :comodo_dragon
    match %r{chromeplus}i,    name: :chromeplus
    match %r{bluechrome}i,    name: :bluechrome
    match %r{awesomium}i,     name: :awesomium
    match %r{qqbrowser}i,     name: :qqbrowser
    match %r{yabrowser}i,     name: :yabrowser
    match %r{rockmelt}i,      name: :rockmelt
    match %r{coolnovo}i,      name: :coolnovo
    match %r{vivaldi}i,       name: :vivaldi
    match %r{colibri}i,       name: :colibri
    match %r{iridium}i,       name: :iridium
    match %r{origin}i,        name: :origin
    match %r{puffin}i,        name: :puffin
    match %r{fluid}i,         name: :fluid
    match %r{brave}i,         name: :brave
    match %r{hana}i,          name: :hana
    match %r{(?<!env)iron}i,  name: :iron

    match %r{qtweb}i,         name: :qtweb_browser,
                              version: %r{net\sbrowser/([\d\.]+)}i
  end

  # inherit properties from matcher where name == :safari, (except :version)
  like :safari, except: [:version] do
    match %r{samsungbrowser}i,     name: :samsungbrowser
    match %r{stainless}i,          name: :stainless
    match %r{cheshire}i,           name: :cheshire
    match %r{omniweb}i,            name: :omniweb
    match %r{skyfire}i,            name: :skyfire
    match %r{mercury}i,            name: :mercury
    match %r{rekonq}i,             name: :rekonq
    match %r{arora}i,              name: :arora
    match %r{raptr}i,              name: :raptr
    match %r{icab}i,               name: :icab
    match %r{bolt}i,               name: :bolt
    match %r{silk}i,               name: :silk
    match %r{qt(?!web)}i,          name: :qt

    match %r{nook}i,               name: :nook,
                                   version: %r{build/\w+\s([\d\.]+)}i

    match %r{kindle}i,             name: :kindle,
                                   version: %r{(?:kindle|version)/([\d\.]+)}i

    match %r{leechcraft}i,         name: :leechcraft,
                                   version: %r{craft/(?:\w+\s)?([\d\.]+)}i

    match %r{webos|wosbrowser}i,   name: :webosbrowser,
                                   version: %r{(?:version|osbrowser)/([\d\.]+)}i

    match %r{blackberry.*?(?=safari)}i, name: :blackberry_browser,
                                        version: %r{version/([\d\.]+)}i
  end

  # inherit properties from matcher where name == :firefox, (except :version)
  like :firefox, except: [:version] do
    # Minefield is firefox nightly, we can now do client.nightly?
    # to find out wether this browser is bleeding edge
    # this method will be caught by method missing if it isn't defined,
    # therefore - this method can be used on every Browserino::Client
    # instance
    match %r{minefield}i,    name: :minefield, nightly: true
    match %r{k-meleon}i,     name: :kmeleon,   version: %r{leon/([\d\.]+)}i
    match %r{k-ninja}i,      name: :kninja,    version: %r{ninja/([\d\.]+)}i
    match %r{waterfox}i,     name: :waterfox,  architecture: :x64
    match %r{granparadiso}i, name: :granparadiso
    match %r{tenfourfox}i,   name: :tenfourfox
    match %r{enigmafox}i,    name: :enigmafox
    match %r{iceweasel}i,    name: :iceweasel
    match %r{seamonkey}i,    name: :seamonkey
    match %r{superswan}i,    name: :superswan
    match %r{lunascape}i,    name: :lunascape
    match %r{kazehakase}i,   name: :kazehakase
    match %r{shiretoko}i,    name: :shiretoko
    match %r{classilla}i,    name: :classilla
    match %r{cometbird}i,    name: :cometbird
    match %r{icedragon}i,    name: :icedragon
    match %r{palemoon}i,     name: :palemoon
    match %r{namoroka}i,     name: :namoroka
    match %r{songbird}i,     name: :songbird
    match %r{firebird}i,     name: :firebird
    match %r{vonkeror}i,     name: :vonkeror
    match %r{conkeror}i,     name: :conkeror
    match %r{netscape}i,     name: :netscape
    match %r{bonecho}i,      name: :bonecho
    match %r{chimera}i,      name: :chimera
    match %r{lolifox}i,      name: :lolifox
    match %r{lorentz}i,      name: :lorentz
    match %r{myibrow}i,      name: :myibrow
    match %r{sylera}i,       name: :sylera
    match %r{iceape}i,       name: :iceape
    match %r{madfox}i,       name: :madfox
    match %r{kapiko}i,       name: :kapiko
    match %r{kmlite}i,       name: :kmlite
    match %r{beonex}i,       name: :beonex
    match %r{icecat}i,       name: :icecat
    match %r{galeon}i,       name: :galeon
    match %r{vision}i,       name: :vision
    match %r{prism}i,        name: :prism
    match %r{pogo}i,         name: :pogo
    match %r{orca}i,         name: :orca

    match %r{camino}i,             name: :camino,
                                   locale: %r{\s(\w{2}(?:\-\w{2})?),}i

    match %r{fireweb\snavigator}i, name: :fireweb_navigator, engine: :gecko,
                                   version: %r{\snavigator/([\d\.]+)}i
  end

  # never thought a browser would want to be like IE...
  like :ie do
    # version does not have to be supplied because we simply want to use
    # the version supplied by the MSIE token instead (there is no version on
    # the avant browser or slimbrowser etc... UA itself)
    match %r{avant\sbrowser}i,    name: :avant_browser
    match %r{greenbrowser}i,      name: :greenbrowser
    match %r{slimbrowser}i,       name: :slimbrowser
    match %r{theworld}i,          name: :theworld
    match %r{browzar}i,           name: :browzar

    # below are special cases where we need to manually
    # supply the version pattern
    match %r{deepnet\sexplorer}i, name: :deepnet_explorer,
                                  version: %r{explorer\s([\d\.]+)}i

    match %r{crazy\sbrowser}i,    name: :crazy_browser,
                                  version: %r{browser\s([\d\.]+)}i

    match %r{solid\score}i,       name: :solid_core,
                                  version: %r{d\score/([\d\.]+)}i

    # we can exclude the default version which will then be replaced by
    # the smart_matcher for :version which uses the :name token automatically
    # upon creating it's pattern
    preset except: [:version] do
      match %r{tencenttraveler}i, name: :tencenttraveler
      match %r{enigma\sbrowser}i, name: :enigma_browser
      match %r{simulbrowse}i,     name: :simulbrowse
      match %r{netcaptor}i,       name: :netcaptor
      match %r{sleipnir}i,        name: :sleipnir
      match %r{irider}i,          name: :irider
      match %r{kkman}i,           name: :kkman
      match %r{lobo}i,            name: :lobo
      match %r{aol}i,             name: :aol
    end
  end
end
