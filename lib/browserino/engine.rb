module Browserino
  module Engine
    def self.name(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:engine][:name]), :name) || Browserino::UNKNOWN
    end

    def self.version(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:engine][:version]), :version) || Browserino::UNKNOWN
    end
  end
end
