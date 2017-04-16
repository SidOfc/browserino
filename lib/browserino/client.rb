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
      [:name, :engine, :platform].each do |prop|
        result   = send prop
        aliasses = Browserino.aliasses[result]

        ver_res = version if prop == :name
        ver_res = send("#{prop}_version") if ver_res.nil?

        # for each of the props:
        # -- define a question method using the value of prop
        #    (ex: name # => firefox # => "firefox?")
        #    -- when supplied with a value, check it against {prop_res}_version
        #    -- when called without argument, return result
        define_singleton_method("#{result}?") do |value = nil|
          return ver_res == value if value
          result
        end

        # for each of the aliasses found:
        # -- define a question method using the current alias
        #    -- when supplied with a value, check it against {prop_res}_version
        #    -- when called without argument, return result
        if aliasses.any?
          aliasses.each do |alt|
            define_singleton_method("#{alt}?") do |value = nil|
              return ver_res == value if value
              result
            end
          end
        end
      end
    end

    def x64?
      architecture == :x64
    end

    def x32?
      architecture == :x32
    end

    # check the type of a Client
    def type?(sym)
      return type == sym if sym.is_a? Symbol
      type == sym.to_sym
    end

    # the catch all method, anything it can ask as question will respond
    # supplying a version is optional, it will simply be nil and skipped
    # and a correct value will still be returned
    def is?(sym, opts = {})
      send "#{sym}?", opts[:version]
    end

    # scary, I know, but a falsy value is all we need to return if some
    # property isn't known or true as any property can be defined on the Client
    def method_missing(_, *__, &___)
      nil
    end

    # always respond to missing, read method_missing comment
    def respond_to_missing?(_, *__, &___)
      true
    end
  end
end
