require "browserino/maps/macintosh"
require "browserino/maps/blackberry"
require "browserino/maps/ios"
require "browserino/maps/linux"
require "browserino/maps/android"
require "browserino/maps/windows"

require "browserino/unknown"
require "browserino/agent"

require "browserino/alias"
require "browserino/version"
require "browserino/match_extractor"
require "browserino/patterns"
require "browserino/browser"
require "browserino/engine"
require "browserino/operating_system"

# require_relative "../spec/user_agents"
# require_relative "../spec/user_agents_bots"
# require_relative "../spec/user_agents_browsers"

module Browserino
  def self.parse(ua, unknown_alt = Browserino::UNKNOWN)
    Agent.new(ua, unknown_alt)
  end

  private

  def self.cleanse(ua)
    #make iphone / ipad / ipod consistent
    ua = ua.gsub(/ip((a|o)d|hone)/i, 'ios')
    #strip legacy mozilla version
    ua = ua.gsub(/(Mozilla\/[\d\.]+)/i, '')
    #strip fake opera version
    ua = ua.gsub(/9\.80/i, '')
    #strip webkit if presto engine is used
    ua = ua.gsub(/(?:apple)?webkit\/[\d\.]+/i, '') if /presto/i =~ ua
    ua = ua.gsub(/linux/i, '') if /android/i =~ ua
    ua
  end

  def self.check_for_aliases(hash)
    hash.inject({}) do |memo, kv|
      ls = ALIAS[kv.first].select { |k, m| true if m.include?(kv.last) }.keys.first || kv.last
      memo[kv.first] = ls
      memo
    end
  end

  def self.agent_id(ua)
    name = nil
    patterns = PATTERNS[:browser].merge(PATTERNS[:bot])
    browsers = patterns.keys
    until browsers.empty? || !name.nil?
      tmp = browsers.shift
      name = tmp if (ua.match(patterns[tmp][:name]))
    end
    name ||= Browserino::UNKNOWN
  end
end
