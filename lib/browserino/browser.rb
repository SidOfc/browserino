module Browserino
  module Browser
    def self.version(ua, patterns)
      if patterns
        MatchExtractor::extract(ua.match(patterns[:version]), :version)
      else
        Browserino::UNKNOWN
      end
    end
  end
end
