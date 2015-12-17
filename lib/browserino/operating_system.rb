module Browserino
  module OperatingSystem
    def self.name(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:name]), :name) || Browserino::UNKNOWN
    end

    def self.version(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:version]), :version) || Browserino::UNKNOWN
    end

    def self.architecture(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:architecture]), :architecture) || Browserino::UNKNOWN
    end
  end
end
