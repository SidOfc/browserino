module Browserino
  module Engine
    def self.name(ua)
      Browserino::extract_match(ua.match(PATTERNS[:engine][:name]), :name)
    end

    def self.version(ua)
      Browserino::extract_match(ua.match(PATTERNS[:engine][:version]), :version) do |v|
        v.gsub('_', '.')
      end
    end
  end
end
