# frozen_string_literal: true
module Browserino
  class Agent
    def initialize(properties = {})
      static = properties.reject { |_, val| val.respond_to? :call }
      procs  = properties.select { |_, val| val.respond_to? :call }

      # Define all non-proc property definitions
      static.each do |name, value|
        define_singleton_method(name) { value }
        define_singleton_method("#{name}?") do |val = nil|
          return value == val if val
          value
        end
      end

      # Define proc
      procs.each do |name, value|
        result = instance_eval(&value)
        define_singleton_method(name) { result }
        define_singleton_method("#{name}?") do |val|
          return value == val if val
          result
        end
      end

      # Define possible type definitions
      Browserino.types.each do |type_name|
        define_singleton_method("#{type_name}?") { type == type_name }
      end

      # Define possible name definitions
      Browserino.names.each do |identity_name|
        define_singleton_method("#{identity_name}?") { name == identity_name }
        define_singleton_method("#{identity_name}?") do |value = nil|
          conditions = [name == identity_name]
          conditions << (version == value) if value.is_a? Integer
          conditions.all?
        end
      end
    end

    def type?(sym)
      type == sym
    end

    def is?(sym, opts = {})
      send "#{sym}?", opts[:version]
    end

    def method_missing(_, *__, &___)
      nil
    end

    def respond_to_missing?(_, *__, &___)
      true
    end
  end
end
