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
      predefined.each do |name, value|
        define_singleton_method(name) { value }
      end

      # Define proc
      procs.each do |name, value|
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
  end
end
