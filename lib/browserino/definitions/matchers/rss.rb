# frozen_string_literal: true
Browserino.config.rss do
  match %r{windows-rss}i, name: :windows_rss
  match %r{rssbandit}i,   name: :rssbandit
end
