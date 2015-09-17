module Browserino
  module Browser
    def self.name(ua, patterns)
      MatchExtractor::extract(ua.match(patterns[:name]), :name)
    end

    def self.version(ua, patterns)
      MatchExtractor::extract(ua.match(patterns[:version]), :version)
    end
  end
end
