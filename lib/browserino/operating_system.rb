module Browserino
  module OperatingSystem
    def self.name(ua)
      ua.match(Browserino::PATTERNS[:operating_system][:name])
    end

    def self.version(ua)
      ua.match(Browserino::PATTERNS[:operating_system][:version])
    end

    def self.architecture(ua)
      ua.match(Browserino::PATTERNS[:operating_system][:architecture])
    end
  end
end
