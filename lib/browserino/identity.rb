# frozen_string_literal: true
module Browserino
  class Identity
    attr_reader :pattern, :collectable

    def initialize(pattern, &block)
      @pattern     = pattern
      @collectable = Collector.new

      instance_eval(&block) if block
    end

    def matches?(user_agent)
      user_agent.match? pattern
    end

    def collect(&block)
      collectable.define_collectors(&block)
    end

    def type(val = nil)
      val && (@type = val) || @type
    end

    def name(val = nil)
      val && (@name = val) || @name
    end
  end
end
