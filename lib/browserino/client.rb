# frozen_string_literal: true
module Browserino
  class Client
    def initialize(properties = {})
      # properties are added as methods that will each be defined in a specific
      # order below. First, seperate static value methods from procs,
      # procs will be able to call methods in this instances' context
      # therefore we need to define static methods before procs

      static = properties.reject { |_, val| val.respond_to? :call }
      procs  = properties.select { |_, val| val.respond_to? :call }

      # for each static property:
      # -- define a method that returns it's property value
      # -- define a question method that returns it's property value or
      #    checks version against supplied value if truthy
      static.each do |name, value|
        define_singleton_method(name) { value }
        define_singleton_method("#{name}?") do |val = nil|
          return value == val if val
          value
        end
      end

      # for each proc property:
      # -- define a method that returns it's instance evalled block value
      # -- define a question method that returns it's instance evalled block
      #    value or checks version against supplied value if truthy
      procs.each do |name, value|
        result = instance_eval(&value)
        define_singleton_method(name) { result }
        define_singleton_method("#{name}?") do |val|
          return value == val if val
          result
        end
      end

      # keep this here to implement aliasses in an easier manner
      # for instance, join an array of aliasses to generate aliassed methods
      # for each of the below properties:
      # -- define a question method using the value of prop if
      #    -- when supplied with a value, check it against {prop_res}_version
      #    -- when called without argument, return {prop_res}
      [:name, :engine, :platform].each do |prop|
        result = send prop

        ver_res = version if prop == :name
        ver_res = send("#{prop}_version") if ver_res.nil?

        define_singleton_method("#{result}?") do |value = nil|
          return ver_res == value if value
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

    # sc
    def method_missing(_, *__, &___)
      nil
    end

    def respond_to_missing?(_, *__, &___)
      true
    end
  end
end
