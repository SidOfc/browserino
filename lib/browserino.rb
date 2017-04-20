# frozen_string_literal: true
require_relative 'browserino/integrate/rails' if defined?(::Rails)

require_relative 'browserino/options'
require_relative 'browserino/config'
require_relative 'browserino/methods'
require_relative 'browserino/client'
require_relative 'browserino/version'
require_relative 'browserino/identity'

require_relative 'browserino/definitions/defaults'
require_relative 'browserino/definitions/filters'
require_relative 'browserino/definitions/labels'

module Browserino
  def self.parse(ua)
    config.before_parse.each { |b| b.call ua } if config.before_parse.any?
    config.identities.each do |identity|
      return analyze ua, identity if identity.matches? ua
    end

    analyze ua
  end
end
