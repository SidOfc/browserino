require "browserino/version"
require "browserino/patterns"
require "browserino/browser"
require "browserino/engine"
require "browserino/operating_system"

module Browserino
  def self.parse ua
    ua = self::clean(ua)
    Browser::name(ua)
  end

  private

  def self.clean ua
    ua.gsub(/(Mozilla\/[\d\.]+)/, '').strip
  end
end
