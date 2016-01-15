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
  def self.parse(ua, unknown_alt = nil)
    if unknown_alt
      puts "The feature for using a custom return value is deprecated and will be removed in a future release. For now, your value will be ignored and nil will be the return value for unknown properties."
    end
    Agent.new(ua, UNKNOWN)
  end

  private

  def self.strip_lies(ua)
    #make iphone / ipad / ipod consistent
    ua = ua.gsub(/ip((a|o)d|hone)/i, 'ios')
    ua = ua.gsub(/(Mozilla\/[\d\.]+)/i, '')
    ua = ua.gsub(/9\.80/i, '')
    ua = ua.gsub(/(?:apple)?webkit\/[\d\.]+/i, '') if /presto/i =~ ua
    ua = ua.gsub(/(?:ms)?ie/i, '') if /rv\:/i =~ ua
    ua = ua.gsub(/linux/i, '') if /android/i =~ ua
    ua = ua.gsub(/x11/i, '') if /bsd/i =~ ua
    ua = ua.gsub(/windows\snt/i, '') if /windows\sphone/i =~ ua
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
    name ||= UNKNOWN
  end

  def self.extract_match(match, sym, trim = true)
    if match && match.names.include?(sym.to_s)
      match[sym].strip! if trim
      match[sym].to_s.downcase
    else
      UNKNOWN
    end
  end
end
