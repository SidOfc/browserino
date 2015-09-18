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
    name = find_browser_name(ua)
    if name == :unknown
      nil
    else
      Agent.new({
        browser_name: name,
        browser_version: Browser::version(ua, PATTERNS[:browser][name]),
        engine_name: Engine::name(ua),
        engine_version: Engine::version(ua),
        system_name: OperatingSystem::name(ua),
        system_version: OperatingSystem::version(ua),
        system_architecture: OperatingSystem::architecture(ua)
      }).to_h
    end
  end

  private

  def self.find_browser_name ua
    name = nil
    browsers = PATTERNS[:browser].keys
    until browsers.empty? || !name.nil?
      tmp = browsers.shift
      name = tmp if (ua.match(PATTERNS[:browser][tmp][:name]))
    end
    name ||= :unknown
  end
end
