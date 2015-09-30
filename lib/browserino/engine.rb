module Browserino
  module Engine
    def self.name(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:engine][:name]), :name).to_s.downcase || Browserino::UNKNOWN
    end

    def self.version(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:engine][:version]), :version).to_s.downcase || Browserino::UNKNOWN
    end
  end
end
