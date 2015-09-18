module Browserino
  module OperatingSystem
    def self.name(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:name]), :name).to_s.downcase
    end

    def self.version(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:version]), :version).to_s.downcase
    end

    def self.architecture(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:architecture]), :architecture).to_s.downcase
    end
  end
end
