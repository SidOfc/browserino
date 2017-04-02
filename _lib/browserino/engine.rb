module Browserino
  module Engine
    def self.name(ua)
      Browserino.extract_match(ua.match(Core::PATTERNS[:engine][:name]), :name)
    end

    def self.version(ua)
      Browserino.extract_match(
        ua.match(Core::PATTERNS[:engine][:version]),
        :version
      ) do |v|
        v.tr('_', '.')
      end
    end
  end
end
