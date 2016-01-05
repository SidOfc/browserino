module Browserino
  module OperatingSystem
    def self.name(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:name]), :name) || UNKNOWN
    end

    def self.version(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:version]), :version) || UNKNOWN
    end

    def self.architecture(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:architecture]), :architecture) || UNKNOWN
    end

    def self.locale(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:locale]), :locale) || UNKNOWN
    end
  end
end
