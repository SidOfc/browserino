# frozen_string_literal: true
module Browserino
  class Agent
    attr_reader :identity

    def initialize(identity, properties = {})
      @identity = identity

      # Define all other possible methods not within the current property list
      (Browserino.property_names - properties.keys).each do |name|
        define_singleton_method(name) { nil }
      end

      # Define all known properties
      properties.each do |name, value|
        define_singleton_method(name) { value }
      end
    end

    def name
      identity.name
    end

    def type
      identity.type
    end
  end
end
