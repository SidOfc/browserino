require_relative 'browserino/core/mapping'
require_relative 'browserino/core/patterns'
require_relative 'browserino/core/supported'
require_relative 'browserino/core/questions'
require_relative 'browserino/core/helpers'
require_relative 'browserino/core/lies'
require_relative 'browserino/core/alias'

require_relative 'browserino/integrate/rails' if defined?(::Rails)

require_relative 'browserino/unknown'
require_relative 'browserino/agent'

require_relative 'browserino/version'
require_relative 'browserino/browser'
require_relative 'browserino/engine'
require_relative 'browserino/operating_system'
require_relative 'browserino/console'

module Browserino
  module_function

  def parse(ua)
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
