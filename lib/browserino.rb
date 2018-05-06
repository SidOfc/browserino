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

module Browserino
  def self.parse(uas)
    config.before_parse.each { |b| uas = b.call uas }
    config.matchers.each do |matcher|
      return analyze uas, matcher if matcher.matches? uas
    end
    analyze uas
  end
end
