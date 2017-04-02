# frozen_string_literal: true
require_relative 'browserino/base'
require_relative 'browserino/collector'
require_relative 'browserino/identity'

module Browserino
  def self.parse(user_agent)
    puts "Parsing: #{user_agent}"
    identities.each do |identity|
      puts "Checking if agent is #{identity.name}"
      if identity.matches? user_agent
        # extractors = @general_collector.properties.merge identity.properties
        puts "Browser is: #{identity.name}"
        return analyze user_agent, identity.collectable
      end
    end
    puts 'Browser is: unknown'
  end

  def self.analyze(user_agent, *collectors)
    base = @general_collector&.properties || {}
    collectors.each_with_object(base) { |c, b| b.merge! c.properties }

    base.each_with_object({}) do |(prop, pattern), result|
      match = pattern.match user_agent
      result[prop] = match && match[1]
    end
  end

  def self.define(&block)
    module_eval(&block)
  end

  def self.general(&block)
    (@general_collector ||= Collector.new).define_collectors(&block)
  end

  def self.identify(pattern, &block)
    identities << Identity.new(pattern, &block)
  end

  def self.identities
    @identities ||= []
  end
end
