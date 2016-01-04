module Browserino
  module Browser
    def self.version(ua, patterns)
      if patterns
        Browserino::extract_match(ua.match(patterns[:version]), :version)
      else
        UNKNOWN
      end
    end
  end
end
