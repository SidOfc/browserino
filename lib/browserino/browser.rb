module Browserino
  module Browser
    def self.name(ua)
      name = nil
      patterns = Core::PATTERNS[:browser].merge(Core::PATTERNS[:bot])
      agents = patterns.keys

      until agents.empty? || !name.nil?
        tmp = agents.shift
        name = tmp if ua.match(patterns[tmp][:name])
      end

      name
    end

    def self.version(ua, patterns)
      if patterns
        Browserino.extract_match(ua.match(patterns[:version]), :version) do |v|
          v.tr('_', '.')
        end
      else
        UNKNOWN
      end
    end
  end
end
