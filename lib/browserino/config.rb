# frozen_string_literal: true
module Browserino
  class Config
    def initialize(options = {})
      @options = options
    end

    def [](key)
      @options[key]
    end

    def []=(key, value)
      @options[key] = value
    end

    def method_missing(sym, *args, &block)
      return @options[to_option(sym)] == args.first if args.any?
      @options[to_option(sym)]
    end

    def respond_to_missing?(sym, *args, &block)
      option? sym
    end

    def merge(other)
      @options.merge! other
      self
    end

    def to_hash
      @options
    end

    def to_a
      @options.to_a
    end

    def to_s
      @options.to_s
    end

    private

    def to_option(sym)
      sym.to_s.tr('?', '').to_sym
    end

    def option?(sym)
      @options.keys.include? to_option(sym)
    end
  end
end
