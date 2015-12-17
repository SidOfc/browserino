module Browserino
  module MatchExtractor
    def self.extract(match, sym, trim = true)
      if match.nil?
        Browserino::UNKNOWN
      elsif match.names.map(&:to_sym).include?(sym)
        match[sym].strip! if trim
        match[sym].to_s.downcase
      else
        Browserino::UNKNOWN
      end
    end
  end
end
