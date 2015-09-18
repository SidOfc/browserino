require "browserino/maps/osx"
require "browserino/maps/ios"
require "browserino/maps/android"
require "browserino/maps/windows"

require "browserino/agent_manipulator"
require "browserino/agent"
require "browserino/version"
require "browserino/match_extractor"
require "browserino/patterns"
require "browserino/browser"
require "browserino/engine"
require "browserino/operating_system"

module Browserino
  def self.parse ua
    ua = AgentManipulator.new(ua).ua
    patterns = find_browser_patterns(ua)
    if patterns == :unknown
      nil
    else
      Agent.new({
        browser_name: Browser::name(ua, patterns),
        browser_version: Browser::version(ua, patterns),
        engine_name: Engine::name(ua),
        engine_version: Engine::version(ua),
        system_name: OperatingSystem::name(ua),
        system_version: OperatingSystem::version(ua),
        system_architecture: OperatingSystem::architecture(ua)
      }).get_hash
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
