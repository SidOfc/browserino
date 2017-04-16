# frozen_string_literal: true
module Browserino
  class Client
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

      # Define proc property definitions
      procs.each do |name, value|
        result = instance_eval(&value)
        define_singleton_method(name) { result }
        define_singleton_method("#{name}?") do |val|
          return value == val if val
          result
        end
      end

      [:name, :engine, :platform].each do |prop|
        result = send prop
        define_singleton_method("#{result}?") do |value = nil|
          return version == value if value
          result
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
