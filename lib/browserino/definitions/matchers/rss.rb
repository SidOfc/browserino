# frozen_string_literal: true
Browserino.config.rss do
  match %r{windows-rss}i,        name: :windows_rss
  match %r{apple-pubsub}i,       name: :apple_pubsub
  match %r{applesyndication}i,   name: :safari_rss
  match %r{netnewswire}i,        name: :netnewswire
  match %r{omea\sreader}i,       name: :omea_reader
  match %r{rssbandit}i,          name: :rssbandit
  match %r{liferea}i,            name: :liferea
  match %r{rssowl}i,             name: :rssowl
  match %r{sage}i,               name: :sage
  match %r{akregator}i,          name: :akregator
  match %r{yahoofeedseeker}i,    name: :yahoofeedseeker
  match %r{feedfetcher-google}i, name: :feedfetcher_google
end
