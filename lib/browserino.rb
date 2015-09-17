require "browserino/maps/osx"
require "browserino/maps/ios"
require "browserino/maps/android"
require "browserino/maps/windows"

require "browserino/agent"
require "browserino/version"
require "browserino/match_extractor"
require "browserino/patterns"
require "browserino/browser"
require "browserino/engine"
require "browserino/operating_system"

module Browserino
  def self.parse ua
    ua = ua.gsub(/(Mozilla\/[\d\.]+)/, '').strip
    patterns = find_browser_patterns(ua)
    if patterns == :unknown
      nil
    else
      Agent.new({
        browser: {
          name: Browser::name(ua, patterns),
          version: Browser::version(ua, patterns)
        },
        engine: {
          name: Engine::name(ua),
          version: Engine::version(ua)
        },
        operating_system: {
          name: OperatingSystem::name(ua),
          version: OperatingSystem::version(ua),
          architecture: OperatingSystem::architecture(ua)
        }
      })
    end
  end

  private

  def self.find_browser_patterns ua
    patterns = nil
    browsers = PATTERNS[:browser].keys
    until browsers.empty? || !patterns.nil?
      browser = PATTERNS[:browser][browsers.shift]
      patterns = browser if (ua.match(browser[:name]))
    end
    patterns ||= :unknown
  end
end
