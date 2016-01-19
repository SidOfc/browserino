module Browserino
  module OperatingSystem
    def self.name(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:name]), :name)
    end

    def self.version(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:version]), :version) do |v|
        v.gsub('_', '.')
      end
    end

    def self.architecture(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:architecture]), :architecture)
    end

    def self.locale(ua)
      Browserino::extract_match(ua.match(PATTERNS[:operating_system][:locale]), :locale)
    end
  end
end
