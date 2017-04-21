# frozen_string_literal: true
module Browserino
  class Identity
    attr_reader :pattern, :properties

    SETTINGS = { name: nil, type: :unknown }.freeze

    def initialize(pattern = //, opts = {}, **additional, &block)
      opts        = pattern if pattern.is_a?(Hash) && opts.empty?
      @properties = SETTINGS.merge(opts.merge(additional))
      @pattern    = pattern

      instance_eval(&block) if block
    end

    def matches?(user_agent)
      pattern =~ user_agent if pattern.is_a? Regexp
    end

    def ===(other)
      return false if properties[:name].nil?

      case other
      when Regexp   then other =~ properties[:name]
      when String   then other.to_sym == properties[:name]
      when Symbol   then other == properties[:name]
      when Identity then other.properties[:name] == properties[:name]
      else false
      end
    end

    def to_str
      properties[:name].to_s
    end

    def =~(other)
      self === other
    end

    def ==(other)
      self === other
    end

    def method_missing(sym, *args, &block)
      return @properties[sym] = block      if block
      return @properties[sym] = args.shift if args.any?

      @properties[sym]
    end

    def respond_to_missing?(_, *__, &___)
      true
    end
  end
end
