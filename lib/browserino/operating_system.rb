module Browserino
  module OperatingSystem
    def self.name(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:name]), :name).to_s.downcase || Browserino::UNKNOWN
    end

    def self.version(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:version]), :version).to_s.downcase || Browserino::UNKNOWN
    end

    def self.architecture(ua)
      MatchExtractor::extract(ua.match(Browserino::PATTERNS[:operating_system][:architecture]), :architecture).to_s.downcase || Browserino::UNKNOWN
    end
  end
end
