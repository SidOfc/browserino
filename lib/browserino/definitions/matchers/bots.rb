# frozen_string_literal: true

# automatically set type to :bot for each defined matcher
# additionally, set text to true to each of the matchers automatically
Browserino.config.bots text: true do
  match %r{huaweisymantecspider}i,        name: :huaweisymantecspider
  match %r{atomic_email_hunter}i,         name: :atomic_email_hunter
  match %r{netresearchserver}i,           name: :netresearchserver
  match %r{autoemailspider}i,             name: :auto_email_spider
  match %r{flaming\sattackbot}i,          name: :flaming_attackbot
  match %r{addsugarspiderbot}i,           name: :addsugarspiderbot
  match %r{semanticdiscovery}i,           name: :semanticdiscovery
  match %r{xaldon_webspider}i,            name: :xaldon_webspider
  match %r{yooglifetchagent}i,            name: :yooglifetchagent
  match %r{mass\sdownloader}i,            name: :mass_downloader
  match %r{safetynet\srobot}i,            name: :safetynet_robot
  match %r{download\sdemon}i,             name: :download_demon
  match %r{internet\sninja}i,             name: :internet_ninja
  match %r{dataparksearch}i,              name: :dataparksearch
  match %r{boston[_ ]project}i,           name: :boston_project
  match %r{emailcollector}i,              name: :emailcollector
  match %r{morning\spaper}i,              name: :morning_paper
  match %r{4anything}i,                   name: :four_anything
  match %r{aqua_products}i,               name: :aqua_products
  match %r{arachnophilia}i,               name: :arachnophilia
  match %r{emeraldshield}i,               name: :emeraldshield
  match %r{womlpefactory}i,               name: :womlpefactory
  match %r{issuecrawler}i,                name: :issuecrawler
  match %r{jaxified\sbot}i,               name: :jaxified_bot
  match %r{stackrambler}i,                name: :stackrambler
  match %r{turnitinbot}i,                 name: :turnitinbot
  match %r{covario-ids}i,                 name: :covario_ids
  match %r{alkaline}i,                    name: :alkalinebot
  match %r{yahoo\!\sslurp}i,              name: :yahoo_slurp
  match %r{emailsiphon}i,                 name: :emailsiphon
  match %r{backdoorbot}i,                 name: :backdoorbot
  match %r{terrawizbot}i,                 name: :terrawizbot
  match %r{searchsight}i,                 name: :searchsight
  match %r{baiduspider}i,                 name: :baiduspider
  match %r{sandcrawler}i,                 name: :sandcrawler
  match %r{fyberspider}i,                 name: :fyberspider
  match %r{linguee\sbot}i,                name: :linguee_bot
  match %r{big\sbrother}i,                name: :big_brother
  match %r{yahooseeker}i,                 name: :yahooseeker
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
  match %r{yasaklibot}i,                  name: :yasaklibot
  match %r{rpt-httpclient}i,              name: :httpclient
  match %r{ahrefsbot}i,                   name: :ahrefsbot
  match %r{mojeekbot}i,                   name: :mojeekbot
  match %r{incywincy}i,                   name: :incywincy
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
  match %r{ng-search}i,                   name: :ng_search
  match %r{youdaobot}i,                   name: :youdaobot
  match %r{yodaobot}i,                    name: :yodaobot
  match %r{ldspider}i,                    name: :ldspider
  match %r{lexxebot}i,                    name: :lexxebot
  match %r{scoutjet}i,                    name: :scoutjet
  match %r{linkedinbot}i,                 name: :linkedin
  match %r{bullseye}i,                    name: :bullseye
  match %r{alexibot}i,                    name: :alexibot
  match %r{whatsapp}i,                    name: :whatsapp
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
  match %r{lmspider}i,                    name: :lmspider
  match %r{blowfish}i,                    name: :blowfish
  match %r{yacybot}i,                     name: :yacybot
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
  match %r{zealbot}i,                     name: :zealbot
  match %r{zspider}i,                     name: :zspider
  match %r{backrub}i,                     name: :backrub
  match %r{harvest}i,                     name: :harvest
  match %r{nymesis}i,                     name: :nymesis
  match %r{radian6}i,                     name: :radian6
  match %r{scrubby}i,                     name: :scrubby
  match %r{gcreep}i,                      name: :gcreep
  match %r{snappy}i,                      name: :snappy
  match %r{vortex}i,                      name: :vortex
  match %r{tineye}i,                      name: :tineye
  match %r{zyborg}i,                      name: :zyborg
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
  match %r{htdig}i,                       name: :htdig
  match %r{peew}i,                        name: :peew
  match %r{yeti}i,                        name: :yeti
  match %r{wf84}i,                        name: :wf84
  match %r{vyu2}i,                        name: :vyu2
  match %r{acoi}i,                        name: :acoi
  match %r{\sobot}i,                      name: :obot
  match %r{(?:ask)\sjeeves}i,             name: :ask
  match %r{b2w}i,                         name: :b2w
  match %r{ipd/}i,                        name: :ipd
  match %r{zao}i,                         name: :zao

  match %r{furlbot}i,                     name: :furlbot,
                                          version: %r{rl\ssearch\s([\d\.]+)}i

  match %r{jakarta}i,                     name: :jakarta,
                                          version: %r{client/([\d\.]+)}i

  match %r{oegp}i,                        name: :oegp,
                                          version: %r{v\.\s([\d\.]+)}i

  match %r{l\.webis}i,                    name: :lwebis,
                                          version: %r{webis/([\d\.]+)}i

  match %r{cerberian\sdrtrs}i,            name: :cerberian_drtrs,
                                          version: %r{version[-/]([\d\.]+)}i

  match %r{gigamega}i,                    name: :gigamega,
                                          version: %r{mega\.bot/([\d\.]+)}i

  match %r{sogou(?:\s\w+)?\s?spider}i,    name: :sogou_spider,
                                          version: %r{spider/([\d\.]+)}i

  match %r{megaindex}i,                   name: :megaindex,
                                          version: %r{index\.ru/([\d\.]+)}i

  match %r{go\!zilla}i,                   name: :gozilla,
                                          version: %r{go\!zilla\s([\d\.]+)}i

  match %r{larbin}i,                      name: :larbin,
                                          version: %r{larbin_([\d\.]+)}i

  match %r{netseer}i,                     name: :netseer,
                                          version: %r{\scrawler/([\d\.]+)}i
end
