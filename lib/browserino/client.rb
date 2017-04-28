# frozen_string_literal: true

module Browserino
  class Client
    attr_reader :property_names

    def initialize(props = {}, like = nil)
      @property_names = props.keys
      @like           = like

      # properties are added as methods that will each be defined in a specific
      # order below. First, seperate static value methods from procs,
      # procs will be able to call methods in this instances' context
      # therefore we need to define static methods before procs

      # for each static property:
      # -- define a method that returns it's property value
      # -- define a question method that returns it's property value or
      #    checks version against supplied value if truthy
      define_simple_methods! props

      # for each proc property:
      # -- define a method that returns it's instance evalled block value
      # -- define a question method that returns it's instance evalled block
      #    value or checks version against supplied value if truthy
      define_proc_methods! props

      # for each of #name, #engine and #platform, use their results as
      # methods names, this will create a method #firefox? for the output
      # of a #name # => :firefox for example.
      define_name_result_methods!

      # finally, add labels and their aliasses into the mix
      # none of these methods should override an existing method
      # therefore we check it's existence using defined?
      define_label_methods!
    end

    def properties
      @properties ||= @property_names.each_with_object({}) do |prop, result|
        result[prop] = send prop
      end
    end

    def like
      @like ||= self
    end

    def like?(sym = nil, opts = {})
      opts  = sym if sym.is_a? Hash
      must  = []
      must << like.is?(sym) if sym
      must << like.version?(opts[:version]) if opts[:version]

      must.any? && must.all?
    end

    def x64?
      @x64_cache ||= architecture == :x64
    end

    def x32?
      @x32_cache ||= architecture == :x32
    end

    def arm?
      @arm_cache ||= architecture == :arm
    end

    # the catch all method, anything it can ask as question will respond
    # otherwise nil is returned, this is also true when supplying a version
    def is?(sym, opts = {})
      return send "#{sym}?", opts[:version] if opts[:version]
      send "#{sym}?"
    end

    def ===(other)
      return false unless name

      case other
      when Regexp then other =~ name
      when String then other.to_sym == name
      when Symbol, Browserino::Client then other == name
      else false
      end
    end

    def ==(other)
      self === other
    end

    def =~(other)
      self === other
    end

    def to_str
      to_s
    end

    def to_json(*args)
      @json_cache ||= properties.map do |prop, val|
        final = val.is_a?(Version) && val.full || val
        [prop, final]
      end.to_h.to_json(*args)
    end

    def to_s
      @str_cache ||= %i[name engine platform].map do |prop|
        n = properties[prop]
        v = properties[prop == :name ? :version : "#{prop}_version".to_sym]
        l = properties[prop == :name ? :label : "#{prop}_label".to_sym]
        a = l ? l : [n, (v.major if v > '0.0.0')].join.to_sym

        [n, a].uniq
      end.flatten.uniq.join(' ').gsub(/\s{2,}/, ' ').strip
    end

    def to_hash
      properties
    end

    def to_h
      properties
    end

    def to_a
      properties.to_a
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

    private

    def version_for(sym)
      mtd = %i[label name].include?(sym) ? :version : "#{sym}_version".to_sym
      properties[mtd]
    end

    def get_answer(mtd, res, ver = nil, val = nil)
      incl = [res, *Browserino.config.aliasses[res]].include? val
      return res.is_a?(Version) ? res > 0 : res && true unless val
      ver && incl ? version_for(mtd) == ver : incl
    end

    def define_simple_methods!(props)
      props.each do |name, value|
        define_singleton_method(name) { value }
        define_question_method! name, value
      end
    end

    def define_question_method!(name, value)
      define_singleton_method("#{name}?") do |val = nil, opts = {}|
        ver = opts.delete :version
        val = val.to_sym if ver
        get_answer name, value, ver, val
      end
    end

    def define_proc_methods!(props)
      props.select { |_, val| val.respond_to? :call }.each do |name, value|
        result = instance_eval(&value)
        define_singleton_method(name) { result }
      end
    end

    def define_name_result_methods!
      %i[name engine platform].each do |prop|
        result  = properties[prop]
        ver_res = version_for(prop)

        # for each of the props:
        # -- define a question method using the value of prop
        #    (ex: name # => firefox # => "firefox?")
        #    -- when supplied with a value, check it against {prop_res}_version
        #    -- when called without argument, return result
        define_singleton_method("#{result}?") do |value = nil|
          return ver_res == value if value
          result && true
        end

        # for each of the aliasses found:
        # -- define a question method using the current alias
        #    -- when supplied with a value, check it against {prop_res}_version
        #    -- when called without argument, return result
        Browserino.config.aliasses[result].each do |alt|
          define_singleton_method("#{alt}?") do |value = nil|
            return ver_res == value if value
            result && true
          end
        end
      end
    end

    def define_label_methods!
      property_names.select { |name| name =~ /label/i }.each do |prop|
        next unless (result = properties[prop])
        ver_res = version_for(prop.to_s.split('_').first)

        define_singleton_method("#{result}?") do |value = nil|
          return ver_res == value if value
          result && true
        end

        Browserino.config.aliasses[result].each do |alt|
          define_singleton_method("#{alt}?") do |value = nil|
            return ver_res == value if value
            result && true
          end
        end
      end
    end
  end
end
