module Browserino
  module Browser
    def self.version(ua, patterns)
      MatchExtractor::extract(ua.match(patterns[:version]), :version).to_s.downcase
    end
  end
end
