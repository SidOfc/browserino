# frozen_string_literal: true

Browserino.config.rss do
  match %r{windows-rss}i,         name: :windows_rss
  match %r{apple-pubsub}i,        name: :apple_pubsub
  match %r{applesyndication}i,    name: :safari_rss
  match %r{sharpreader}i,         name: :sharpreader
  match %r{netnewswire}i,         name: :netnewswire
  match %r{omea\sreader}i,        name: :omea_reader
  match %r{rssbandit}i,           name: :rssbandit
  match %r{rss\smenu}i,           name: :rss_menu
  match %r{rss\spopper}i,         name: :rss_popper
  match %r{homepage\srss\sread}i, name: :seznam_rss
  match %r{nfreader}i,            name: :nfreader
  match %r{magpierss}i,           name: :magpierss
  match %r{gregarius}i,           name: :gregarius
  match %r{newsbreak}i,           name: :newsbreak
  match %r{blogbridge}i,          name: :blogbridge
  match %r{yeahreader}i,          name: :yeahreader
  match %r{newsbeuter}i,          name: :newsbeuter
  match %r{greatnews}i,           name: :greatnews
  match %r{bloglines}i,           name: :bloglines
  match %r{icatcher}i,            name: :icatcher
  match %r{newsfox}i,             name: :newsfox
  match %r{quiterss}i,            name: :quiterss
  match %r{liferea}i,             name: :liferea
  match %r{aiderss}i,             name: :aiderss
  match %r{reeder}i,              name: :reeder
  match %r{rssowl}i,              name: :rssowl
  match %r{feedly}i,              name: :feedly
  match %r{abilon}i,              name: :abilon
  match %r{shrook}i,              name: :shrook
  match %r{awasu}i,               name: :awasu
  match %r{sage}i,                name: :sage
  match %r{akregator}i,           name: :akregator
  match %r{trileet\snewsroom}i,   name: :trileet_newsroom
  match %r{digg\sfeed\sfetcher}i, name: :digg_feed_fetcher
  match %r{yahoofeedseeker}i,     name: :yahoofeedseeker
  match %r{universalfeedparser}i, name: :universalfeedparser
  match %r{feedfetcher-google}i,  name: :feedfetcher_google
end
