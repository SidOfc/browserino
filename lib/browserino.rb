require "browserino/maps/macintosh"
require "browserino/maps/blackberry"
require "browserino/maps/ios"
require "browserino/maps/bsd"
require "browserino/maps/linux"
require "browserino/maps/android"
require "browserino/maps/windows"
require "browserino/maps/windows_phone"

require "browserino/integrate/rails" if defined?(::Rails)

require "browserino/unknown"
require "browserino/agent"

require "browserino/alias"
require "browserino/version"
require "browserino/patterns"
require "browserino/browser"
require "browserino/engine"
require "browserino/operating_system"

# require_relative "../spec/user_agents"
# require_relative "../spec/user_agents_bots"
# require_relative "../spec/user_agents_browsers"

module Browserino
  def self.parse(ua, _ = nil) # _ = nil maintains backwards compatibility
    Agent.new ua
  end

  private

  def self.strip_lies(ua)
    ua = ua.gsub(/(Mozilla\/[\d\.]+)/i, '')
    ua = ua.gsub(/9\.80/, '') if /opera/i =~ ua
    ua = ua.gsub(/(?:apple)?webkit\/[\d\.]+/i, '') if /presto/i =~ ua
    ua = ua.gsub(/(?:ms)?ie/i, '') if /rv\:/i =~ ua
    ua = ua.gsub(/linux/i, '') if /android/i =~ ua
    ua = ua.gsub(/x11/i, '') if /bsd/i =~ ua
    ua = ua.gsub(/windows\snt/i, '') if /windows\sphone/i =~ ua
    ua
  end

  def self.check_for_aliases(h)
    ALIAS.each do |k, v|
      h[k] = v.select { |n, re| n if h[k] =~ re }.keys.first || h[k]
    end
    h
  end

  def self.extract_match(match, sym)
    if match && match.names.include?(sym.to_s)
      m = match[sym].to_s.downcase.strip
      m = yield(m) if block_given?
      if m && m.strip != ''
        m
      else
        UNKNOWN
      end
    else
      UNKNOWN
    end
  end
end
