# frozen_string_literal: true
require_relative 'browserino/methods'
require_relative 'browserino/agent'
require_relative 'browserino/identity'

require_relative 'browserino/agent/version'

require_relative 'browserino/definitions/lies'
require_relative 'browserino/definitions/format'
require_relative 'browserino/definitions/default'

module Browserino
  def self.parse(user_agent)
    before_parse.each { |b| b.call user_agent } if before_parse.any?
    identities.each do |_, identity|
      return analyze user_agent, identity if identity.matches? user_agent
    end

    analyze user_agent
  end
end
