module Browserino
  module Browser
    def self.name(ua, patterns)
      ua.match(patterns[:name])
    end

    def self.version(ua, patterns)
      ua.match(patterns[:version])
    end
  end
end
