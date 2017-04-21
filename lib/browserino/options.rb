# frozen_string_literal: true
module Browserino
  class Options
    def initialize(options = {})
      @options = options
    end

    def method_missing(sym, *args, &block)
      return @options[opt(sym)] == args.first if args.any?
      @options[opt(sym)]
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

    def opt(sym)
      sym.to_s.tr('?', '').to_sym
    end

    def option?(sym)
      @options.keys.include? opt(sym)
    end
  end
end
