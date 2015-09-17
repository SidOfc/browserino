module Browserino
  module Engine
    def self.name(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:engine][:name]), :name)
    end

    def self.version(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:engine][:version]), :version)
    end
  end
end
