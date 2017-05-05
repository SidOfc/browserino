# frozen_string_literal: true

Browserino.config.browsers do
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
    modern         true
  end

  match %r{ope?ra?\smini}i do
    name           :opera_mini
    version        %r{ope?ra?\smini/([\d\.]+)}i
    engine         %r{(presto|webkit)}i
  end

  match %r{ope?ra?[^\w]}i do
    name           :opera
    version        %r{(?:ope?ra?[\s/]|version/)([\d\.]+)}i
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
    modern         { version >= 10 }
  end

  match %r{origyn\sweb\sbrowser}i, name: :origyn,          engine: :webkit
  match %r{webpositive}i,          name: :webpositive,     engine: :webkit
  match %r{nintendobrowser}i,      name: :nintendobrowser, engine: :webkit
  match %r{deskbrowse}i,           name: :deskbrowse,      engine: :webkit
  match %r{qupzilla}i,             name: :qupzilla,        engine: :webkit
  match %r{midori}i,               name: :midori,          engine: :webkit
  match %r{shiira}i,               name: :shiira,          engine: :webkit
  match %r{element\sbrowser}i,     name: :element_browser, engine: :webkit
  match %r{amigavoyager}i,         name: :amigavoyager
  match %r{acorn\sbrowse}i,        name: :browse
  match %r{mothra}i,               name: :mothra
  match %r{(?<!(?:net))surf}i,     name: :surf
  match %r{spray\-can}i,           name: :spray_can
  match %r{bunjalloo}i,            name: :bunjalloo

  match %r{inet\sbrowser}i,    name: :inet_browser,
                               platform: :star_blade_os

  match %r{webpro}i,           name: :webpro,
                               locale: %r{\[(\w{2}(?:\-\w{2})?)\]}i

  match %r{sundance}i,         name: :sundance,
                               version: %r{(?:version/|sundance/)([\d\.]+)}i

  match %r{ibm\swebexplorer}i, name: :ibm_webexplorer, platform: :os2,
                               version: %r{bexplorer\s?/v?([\d\.]+)}i

  match %r{navscape}i,         name: :navscape, engine: :webkit,
                               version: %r{navscape/(?:\w+-)?([\d\.]+)}i

  match %r{firefox|phoenix}i do
    name           :firefox
    engine         %r{(gecko|servo)}i
    engine_version %r{(?:rv:\s?|servo/)([\d\.]+)}i
    modern         { version >= 50 }
  end

  match %r{chrome(?:ium)?}i do
    name           :chrome
    version        %r{chrome(?:ium)?/([\d\.]+)}i
    engine         %r{(webkit|blink)}i
    modern         { version >= 50 }
  end

  match %r{safari}i do
    name           :safari
    engine         :webkit
    version        %r{(?:safari|version)/([\d\.]+)}i
    modern         { version >= 9 }
  end

  match %r{tizenbrowser}i,       name: :tizenbrowser, engine: :webkit
  match %r{epiphany}i,           name: :epiphany,     engine: :webkit
  match %r{uzbl}i,               name: :uzbl,         engine: :webkit
  match %r{roccat}i,             name: :roccat,       engine: :webkit
  match %r{dolfin}i,             name: :dolfin,       engine: :webkit
  match %r{dooble}i,             name: :dooble,       engine: :webkit
  match %r{adobeair}i,           name: :adobeair,     engine: :webkit
  match %r{abrowse}i,            name: :abrowse,      engine: :webkit
  match %r{vimprobable}i,        name: :vimprobable,  engine: :webkit
  match %r{osb\-browser}i,       name: :osb_browser,  engine: :webkit
  match %r{edbrowse}i,           name: :edbrowse,     text: true
  match %r{amaya}i,              name: :amaya,        text: true
  match %r{lynx}i,               name: :lynx,         text: true
  match %r{linemode}i,           name: :linemode,     text: true
  match %r{elinks}i,             name: :elinks,       text: true
  match %r{netpositive}i,        name: :netpositive
  match %r{mucommander}i,        name: :mucommander
  match %r{onebrowser}i,         name: :onebrowser
  match %r{flashfire}i,          name: :flashfire
  match %r{konqueror}i,          name: :konqueror
  match %r{cyberdog}i,           name: :cyberdog
  match %r{offbyone}i,           name: :offbyone
  match %r{hotjava}i,            name: :hotjava
  match %r{netsurf}i,            name: :netsurf
  match %r{contiki}i,            name: :contiki
  match %r{mosaic|ibrowse[^r]}i, name: :mosaic
  match %r{netbox}i,             name: :netbox
  match %r{dillo}i,              name: :dillo
  match %r{ice\sbrowser}i,       name: :ice_browser

  match %r{emacs}i,          name: :emacs, text: true,
                             version: %r{emacs(?:\-\w+)?/([\d\.]+)}i

  match %r{UP\.Browser},     name: :openwave_browser,
                             version: %r{UP\.Browser/([\d\.]+)}i

  match %r{alienblue}i,      name: :alienblue,
                             version: %r{alienblue(?:hd)?/([\d\.]+)}i

  match %r{ovibrowser}i,     name: :ovibrowser,  engine: :gecko,
                             engine_version: %r{rv:\s?([\d\.]+)}i

  match %r{links}i,          name: :links,
                             version: %r{links\s\(([\d\.]+)}i

  match %r{oregano}i,        name: :oregano,
                             locale: %r{\[(\w{2}(?:\-\w{2})?)\]}i

  match %r{browsex}i,        name: :browsex, version: %r{wsex\s\(([\d\.]+)}i,
                             locale: %r{\[(\w{2}(?:\-\w{2})?)\]}i

  match %r{doris}i,          name: :doris,
                             locale: %r{\[(\w{2}(?:\-\w{2})?)\]}i

  match %r{retawq}i,         name: :retawq, text: true,
                             locale: %r{\[(\w{2}(?:\-\w{2})?)\]}i

  # inherit properties a standard set of properties by the name of a
  # previously defined matcher, overwritten by properties added within matchers
  # inherit properties from matcher where name == :chrome, (except :version)
  like :chrome, except: [:version] do
    match %r{steam\sgame}i,       name: :steam, version: %r{eoverlay/([\d\.]+)}i
    match %r{whitehat\saviator}i, name: :whitehat_aviator
    match %r{c_coc_browser}i,     name: :coc_coc_browser
    match %r{comodo_dragon}i,     name: :comodo_dragon
    match %r{chromeplus}i,        name: :chromeplus
    match %r{bluechrome}i,        name: :bluechrome
    match %r{taobrowser}i,        name: :taobrowser
    match %r{blackhawk}i,         name: :blackhawk
    match %r{fabrowser}i,         name: :fabrowser
    match %r{mxbrowser}i,         name: :mxbrowser
    match %r{awesomium}i,         name: :awesomium
    match %r{qqbrowser}i,         name: :qqbrowser
    match %r{yabrowser}i,         name: :yabrowser
    match %r{chromeum}i,          name: :chromeum
    match %r{polarity}i,          name: :polarity
    match %r{rockmelt}i,          name: :rockmelt
    match %r{coolnovo}i,          name: :coolnovo
    match %r{slimboat}i,          name: :slimboat
    match %r{safepay}i,           name: :safepay
    match %r{vivaldi}i,           name: :vivaldi
    match %r{colibri}i,           name: :colibri
    match %r{iridium}i,           name: :iridium
    match %r{yowser}i,            name: :yowser
    match %r{origin}i,            name: :origin
    match %r{puffin}i,            name: :puffin
    match %r{amigo}i,             name: :amigo
    match %r{fluid}i,             name: :fluid
    match %r{kinza}i,             name: :kinza
    match %r{swing}i,             name: :swing
    match %r{brave}i,             name: :brave
    match %r{perk}i,              name: :perk
    match %r{hana}i,              name: :hana
    match %r{(?<!env)iron}i,      name: :iron

    match %r{nichrome}i,          name: :nichrome, engine: :webkit,
                                  version: %r{chrome[\s/]\w+[\s/]([\d\.]+)}i

    match %r{mxnitro}i,           name: :maxthon_nitro,
                                  version: %r{mxnitro/([\d\.]+)}i

    match %r{qtweb}i,             name: :qtweb_browser,
                                  version: %r{net\sbrowser/([\d\.]+)}i
  end

  # inherit properties from matcher where name == :safari, (except :version)
  like :safari, except: [:version] do
    match %r{obigo}i,              name: :obigo, version: %r{obigo/w?([\d\.]+)}i
    match %r{playbook}i,           name: :playbook_browser
    match %r{samsungbrowser}i,     name: :samsungbrowser
    match %r{nokiabrowser}i,       name: :nokiabrowser
    match %r{mqqbrowser}i,         name: :mqqbrowser
    match %r{webbrowser}i,         name: :webbrowser
    match %r{stainless}i,          name: :stainless
    match %r{cheshire}i,           name: :cheshire
    match %r{teashark}i,           name: :teashark
    match %r{omniweb}i,            name: :omniweb
    match %r{skyfire}i,            name: :skyfire
    match %r{mercury}i,            name: :mercury
    match %r{rekonq}i,             name: :rekonq
    match %r{coast}i,              name: :coast
    match %r{arora}i,              name: :arora
    match %r{maple}i,              name: :maple
    match %r{raptr}i,              name: :raptr
    match %r{icab}i,               name: :icab
    match %r{bolt}i,               name: :bolt
    match %r{silk}i,               name: :silk
    match %r{coda}i,               name: :coda
    match %r{qt(?!web)}i,          name: :qt

    match %r{xiaomi/miuibrowser}i, name: :xiaomi_miui,
                                   version: %r{miuibrowser/([\d\.]+)}i

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

  # inherit properties from matcher where name == :opera
  like :opera do
    match %r{opera\smobi}i, name: :opera_mobile,
                            version: %r{era\smobi/([\d\.]+)}i
  end

  match %r{maemo;}i, name: :maemo, like: :opera_mobile

  # inherit properties from matcher where name == :firefox, (except :version)
  like :firefox, except: [:version] do
    # Minefield is firefox nightly, we can now do client.nightly?
    # to find out wether this browser is bleeding edge
    # this method will be caught by method missing if it isn't defined,
    # therefore - this method can be used on every Browserino::Client
    # instance
    match %r{camino}i,          name: :camino, locale: %r{(\w{2}(?:\-\w{2})?),}i
    match %r{fireweb\snaviga}i, name: :fireweb_navigator, engine: :gecko
    match %r{minefield}i,       name: :minefield,         nightly: true
    match %r{waterfox}i,        name: :waterfox,          architecture: :x64
    match %r{monyq}i,           name: :monyq,             engine: :gecko
    match %r{sailfishbrowser}i, name: :sailfishbrowser
    match %r{maemo\sbrowser}i,  name: :maemo_browser
    match %r{granparadiso}i,    name: :granparadiso
    match %r{swiftweasel}i,     name: :swiftweasel
    match %r{tenfourfox}i,      name: :tenfourfox
    match %r{kazehakase}i,      name: :kazehakase
    match %r{enigmafox}i,       name: :enigmafox
    match %r{iceweasel}i,       name: :iceweasel
    match %r{seamonkey}i,       name: :seamonkey
    match %r{multizilla}i,      name: :multizilla
    match %r{lightning}i,       name: :lightning
    match %r{superswan}i,       name: :superswan
    match %r{lunascape}i,       name: :lunascape
    match %r{shiretoko}i,       name: :shiretoko
    match %r{classilla}i,       name: :classilla
    match %r{cometbird}i,       name: :cometbird
    match %r{blackbird}i,       name: :blackbird
    match %r{icedragon}i,       name: :icedragon
    match %r{cunaguaro}i,       name: :cunaguaro
    match %r{swiftfox}i,        name: :swiftfox
    match %r{palemoon}i,        name: :palemoon
    match %r{cyberfox}i,        name: :cyberfox
    match %r{namoroka}i,        name: :namoroka
    match %r{songbird}i,        name: :songbird
    match %r{firebird}i,        name: :firebird
    match %r{vonkeror}i,        name: :vonkeror
    match %r{conkeror}i,        name: :conkeror
    match %r{netscape}i,        name: :netscape
    match %r{k-meleon}i,        name: :k_meleon
    match %r{k-ninja}i,         name: :k_ninja
    match %r{bonecho}i,         name: :bonecho
    match %r{sundial}i,         name: :sundial
    match %r{chimera}i,         name: :chimera
    match %r{lolifox}i,         name: :lolifox
    match %r{lorentz}i,         name: :lorentz
    match %r{myibrow}i,         name: :myibrow
    match %r{sylera}i,          name: :sylera
    match %r{fennec}i,          name: :fennec
    match %r{iceape}i,          name: :iceape
    match %r{madfox}i,          name: :madfox
    match %r{kapiko}i,          name: :kapiko
    match %r{kmlite}i,          name: :kmlite
    match %r{beonex}i,          name: :beonex
    match %r{minimo}i,          name: :minimo
    match %r{icecat}i,          name: :icecat
    match %r{galeon}i,          name: :galeon
    match %r{vision}i,          name: :vision
    match %r{strata}i,          name: :strata
    match %r{prism}i,           name: :prism
    match %r{light/}i,          name: :light
    match %r{wyzo}i,            name: :wyzo
    match %r{kylo}i,            name: :kylo
    match %r{epic}i,            name: :epic
    match %r{pogo}i,            name: :pogo
    match %r{orca}i,            name: :orca
  end

  # never thought a browser would want to be like IE...
  like :ie do
    # version does not have to be supplied because we simply want to use
    # the version supplied by the MSIE token instead (there is no version on
    # the avant browser or slimbrowser etc... UA itself)
    match %r{avant\sbrowser}i,    name: :avant_browser
    match %r{greenbrowser}i,      name: :greenbrowser
    match %r{slimbrowser}i,       name: :slimbrowser
    match %r{smart\sbro}i,        name: :smart_bro
    match %r{theworld}i,          name: :theworld
    match %r{browzar}i,           name: :browzar

    # below are special cases where we need to manually
    # supply the version pattern
    match %r{flexnetdesktopclient}i, name: :netflix_desktop,
                                     version: %r{pclient_([\d\.\_]+)}i

    match %r{MetaSr},                name: :sogou_browser,
                                     version: %r{metasr\s([\d\.\_]+)}i

    # we can exclude the default version which will then be replaced by
    # the smart_matcher for :version which uses the :name token automatically
    # upon creating it's pattern
    preset except: [:version] do
      match %r{deepnet\sexplorer}i, name: :deepnet_explorer
      match %r{tencenttraveler}i,   name: :tencenttraveler
      match %r{enigma\sbrowser}i,   name: :enigma_browser
      match %r{crazy\sbrowser}i,    name: :crazy_browser
      match %r{simulbrowse}i,       name: :simulbrowse
      match %r{solid\score}i,       name: :solid_core
      match %r{gomezagent}i,        name: :gomezagent
      match %r{sitekiosk}i,         name: :sitekiosk
      match %r{netcaptor}i,         name: :netcaptor
      match %r{sleipnir}i,          name: :sleipnir
      match %r{irider}i,            name: :irider
      match %r{kkman}i,             name: :kkman
      match %r{lobo}i,              name: :lobo
      match %r{foxy}i,              name: :foxy
      match %r{\bIon\b},            name: :ion
      match %r{aol}i,               name: :aol
    end
  end
end
