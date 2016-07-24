require 'browserino/maps/mapping'
require 'browserino/maps/macintosh'
require 'browserino/maps/blackberry'
require 'browserino/maps/ios'
require 'browserino/maps/bsd'
require 'browserino/maps/linux'
require 'browserino/maps/solaris'
require 'browserino/maps/android'
require 'browserino/maps/windows'
require 'browserino/maps/windows_phone'

require 'browserino/core/patterns'
require 'browserino/core/supported'
require 'browserino/core/questions'
require 'browserino/core/helpers'
require 'browserino/core/lies'
require 'browserino/core/alias'

require 'browserino/integrate/rails' if defined?(::Rails)

require 'browserino/unknown'
require 'browserino/agent'

require 'browserino/version'
require 'browserino/browser'
require 'browserino/engine'
require 'browserino/operating_system'
require 'browserino/console'

# require_relative "../spec/user_agents"
# require_relative "../spec/user_agents_bots"
# require_relative "../spec/user_agents_consoles"
# require_relative "../spec/user_agents_browsers"

module Browserino
  module_function

  def parse(ua, _ = nil) # _ = nil maintains backwards compatibility
    name = Browser.name(ua)
    info = fetch_info(strip_lies(ua), name)
    tmp = info[:name].to_s.tr('_', ' ')
    info[:name] = tmp.strip == '' ? nil : tmp

    Agent.new check_for_aliases(info), ua
  end

  def fetch_info(ua, name)
    { name: name,
      browser_version: Browser.version(ua, name),
      engine_name: Engine.name(ua),
      engine_version: Engine.version(ua),
      system_name: OperatingSystem.name(ua),
      system_version: OperatingSystem.version(ua),
      system_architecture: OperatingSystem.architecture(ua),
      console_name: Console.name(ua),
      locale: OperatingSystem.locale(ua) }
  end

  def strip_lies(ua)
    Core::LIES.inject(ua) do |s, arr|
      s = s.gsub(arr[0], '') if arr[1] == true || s =~ arr[1]
      s
    end
  end

  def check_for_aliases(h)
    Core::ALIAS.each do |k, v|
      h[k] = v.select { |n, re| n if h[k] =~ re }.keys.first || h[k]
    end
    h
  end

  def extract_match(match, sym)
    if match && match.names.include?(sym.to_s)
      m = match[sym].to_s.downcase.strip
      m = yield(m) if block_given?
      m
    else
      UNKNOWN
    end
  end
end
