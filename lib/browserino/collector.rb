# frozen_string_literal: true
module Browserino
  class Collector
    attr_reader :properties

    def initialize(&block)
      @properties = {}
      instance_eval(&block) if block
    end

    def define_collectors(&block)
      instance_eval(&block)
    end

    def method_missing(sym, *args, &_block)
      @properties[sym] = args.shift
    end

    def respond_to_missing?(_sym, *_args, &_block)
      true
    end
  end
end
