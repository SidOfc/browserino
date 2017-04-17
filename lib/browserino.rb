# frozen_string_literal: true
require_relative 'browserino/methods'
require_relative 'browserino/identity'
require_relative 'browserino/client'

require_relative 'browserino/version'

require_relative 'browserino/definitions/lies'
require_relative 'browserino/definitions/defaults'
require_relative 'browserino/definitions/processors'

module Browserino
  def self.parse(ua)
    before_parse.each { |b| b.call ua } if before_parse.any?
    identities.each do |_, identity|
      return analyze ua, identity if identity.matches? ua
    end

    analyze ua
  end
end
