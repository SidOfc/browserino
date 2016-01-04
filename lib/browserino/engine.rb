module Browserino
  module Engine
    def self.name(ua)
      Browserino::extract_match(ua.match(PATTERNS[:engine][:name]), :name) || UNKNOWN
    end

    def self.version(ua)
      Browserino::extract_match(ua.match(PATTERNS[:engine][:version]), :version) || UNKNOWN
    end
  end
end
