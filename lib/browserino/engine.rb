module Browserino
  module Engine
    def self.name(ua)
      ua.match(Browserino::PATTERNS[:engine][:name])
    end

    def self.version(ua)
      ua.match(Browserino::PATTERNS[:engine][:version])
    end
  end
end
