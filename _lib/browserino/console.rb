module Browserino
  module Console
    def self.name(ua)
      Browserino.extract_match(
        ua.match(Core::PATTERNS[:console][:name]),
        :name
      )
    end
  end
end
