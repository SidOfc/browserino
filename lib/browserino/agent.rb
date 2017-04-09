# frozen_string_literal: true
module Browserino
  class Agent
    attr_reader :identity, :name, :type

    def initialize(identity, properties = {})
      @identity = identity
      @name     = identity&.name
      @type     = identity&.type

      # Define all global (excluding current property) definitions
      (Browserino.property_names - properties.keys).each do |name|
        define_singleton_method(name) { nil }
      end

      # Define all property definitions
      format_property_values(properties).each do |name, value|
        define_singleton_method(name) { value }
      end

      # Define possible type definitions
      Browserino.type_names.each do |type_name|
        define_singleton_method("#{type_name}?") { type == type_name }
      end

      # Define possible name definitions
      Browserino.names.each do |identity_name|
        define_singleton_method("#{identity_name}?") { name == identity_name }
      end
    end

    def type?(sym)
      type == sym
    end

    def method_missing(s, *a, &b)
      nil
    end

    def format_property_values(properties)
      properties.each_with_object({}) do |(prop, value), store|
        store[prop] = convert value, format: prop
      end
    end

    def convert(val, **opts)
      formatters = Browserino.formatters[:global].dup
      formatters << Browserino.formatters[opts[:format]]

      formatters.compact.each do |fmt|
        val = fmt.call val
      end

      val
    end
  end
end
