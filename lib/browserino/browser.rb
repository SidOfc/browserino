module Browserino
  module Browser
    def self.version(ua, patterns)
      out = MatchExtractor::extract(ua.match(patterns[:version]), :version).to_s.downcase unless patterns.nil?
      out ||= Browserino::UNKNOWN
    end
  end
end
