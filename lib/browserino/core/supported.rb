module Browserino
  module Core
    SUPPORTED_ALIASSES = {
       browsers: {firefox: [:ff]},
       social_media: {facebook: [:fb]},
       search_engines: {duckduckgo: [:ddg]},
       bots: {},
       consoles: {},
       operating_systems: {macintosh: [:osx], blackberry: [:bb],
                           windows: [:win]}
    }.freeze

    SUPPORTED = {
      browsers: (PATTERNS[:browser].keys +
                 SUPPORTED_ALIASSES[:browsers].values.flatten),
      social_media: [:facebook, :twitter, :linkedin,
                     :instagram, :pinterest, :tumblr] +
                    SUPPORTED_ALIASSES[:social_media].values.flatten,
      search_engines: [:google, :bing, :yahoo_slurp,
                       :baiduspider, :duckduckgo] +
                      SUPPORTED_ALIASSES[:search_engines].values.flatten,
      libraries: PATTERNS[:library].keys,
      bots: (PATTERNS[:bot].keys + SUPPORTED_ALIASSES[:bots].values.flatten),
      consoles: [:xbox, :playstation, :nintendo_ds, :wii] +
                SUPPORTED_ALIASSES[:consoles].values.flatten,
      operating_systems: (Browserino::Mapping
                            .constants(:true)
                            .map(&:downcase) + SUPPORTED_ALIASSES[:operating_systems].values.flatten)
    }.freeze
  end
end
