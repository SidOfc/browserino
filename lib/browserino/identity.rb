# frozen_string_literal: true
module Browserino
  class Identity
    attr_reader :pattern, :collectable, :alias

    def initialize(pattern, **opts, &block)
      @pattern     = pattern
      @collectable = Collector.new
      @alias       = nil

      name opts[:name] if opts[:name]
      type opts[:type] if opts[:type]

      instance_eval(&block) if block
    end

    def matches?(user_agent)
      user_agent.match? pattern
    end

    def ===(other)
      case other
      when Regexp then other.match? name
      when String then other.to_sym == name
      when Symbol then other == name
      when Browserino::Identity then other.name == name
      else false
      end
    end

    def ==(other)
      self === other
    end

    def collect(&block)
      collectable.define_collectors(&block)
    end

    def collector(other = nil)
      other && (@collectable = other) || @collectable
    end

    def alias_of(val = nil)
      val && (@alias = val) || @alias
    end

    def type(val = nil)
      val && (@type = val) || @type
    end

    def name(val = nil)
      val && (@name = val) || @name
    end
  end
end
