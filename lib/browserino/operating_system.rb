module Browserino
  module OperatingSystem
    def self.name(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:name]), :name)
    end

    def self.version(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:version]), :version)
    end

    def self.architecture(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:architecture]), :architecture)
    end
  end
end
