module Browserino
  module Browser
    def self.name(ua = nil)
      name = nil
      browsers = Browserino::PATTERNS[:browser].keys
      until browsers.empty? || !name.nil?
        subject = browsers.shift
        name = subject if (ua.match(Browserino::PATTERNS[:browser][subject][:name]))
      end
      name ||= :unknown
    end

    def self.version
    end
  end
end
