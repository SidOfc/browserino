# frozen_string_literal: true
module Browserino
  class Agent
    def initialize(properties = {})
      # Define all global (excluding current property) definitions
      (Browserino.properties - properties.keys).each do |name|
        define_singleton_method(name) { nil }
      end

      predefined = properties.reject { |_, val| val.respond_to? :call }
      procs      = properties.select { |_, val| val.respond_to? :call }

      # Define all non-proc property definitions
      format_property_values(predefined).each do |name, value|
        define_singleton_method(name) { value }
      end

      # Define proc
      format_property_values(procs).each do |name, value|
        result = instance_eval(&value)
        define_singleton_method(name) { result }
      end

      # Define possible type definitions
      Browserino.types.each do |type_name|
        define_singleton_method("#{type_name}?") { type == type_name }
      end

      # Define possible name definitions
      Browserino.names.each do |identity_name|
        define_singleton_method("#{identity_name}?") { name == identity_name }
      end
    end

    def method_missing(_, *__, &___)
      nil
    end

    def respond_to_missing?(_, *__, &___)
      true
    end

    private

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
