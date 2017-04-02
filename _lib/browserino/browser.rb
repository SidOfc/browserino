module Browserino
  module Browser
    def self.name(ua)
      name = nil
      patterns = Core::PATTERNS[:browser].merge(Core::PATTERNS[:bot])
                                         .merge(Core::PATTERNS[:library])
      agents = patterns.keys

      until agents.empty? || !name.nil?
        tmp = agents.shift
        name = tmp if ua.match(patterns[tmp][:name])
      end

      name
    end

    def self.version(ua, name)
      patterns = Core::PATTERNS[:browser][name] || Core::PATTERNS[:library][name]
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
