# frozen_string_literal: true

require_relative 'browserino/integrate/rails' if defined?(::Rails)

require_relative 'browserino/options'
require_relative 'browserino/config'
require_relative 'browserino/methods'
require_relative 'browserino/client'
require_relative 'browserino/version'
require_relative 'browserino/matcher'

require_relative 'browserino/definitions/matchers'
require_relative 'browserino/definitions/aliasses'
require_relative 'browserino/definitions/filters'
require_relative 'browserino/definitions/labels'
require_relative 'browserino/definitions/missing_props'

module Browserino
  def self.parse(uas, headers = nil)
    uas = '' unless uas #stringify user agent before usage when nil or false

    uas = config.before_parse.reduce(uas) { |u, b| b.call u }
    config.matchers.each do |matcher|
      return analyze uas, matcher, headers if matcher.matches? uas
    end
    analyze uas, nil, headers
  end
end
