# frozen_string_literal: true
module Browserino
  class Identity
    attr_reader :pattern, :alias, :properties

    def initialize(pattern, opts = {}, &block)
      @alias      = opts.delete :to
      @properties = opts
      @pattern    = pattern

      instance_eval(&block) if block
    end

    def alias?
      @alias
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

    def method_missing(sym, *args, &_)
      @properties[sym] = args.shift if args.any?
      @properties[sym]
    end

    def respond_to_missing?(_, *__, &___)
      true
    end
  end
end
