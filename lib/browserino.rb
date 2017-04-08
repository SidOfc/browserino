# frozen_string_literal: true
require_relative 'browserino/base'
require_relative 'browserino/collector'
require_relative 'browserino/identity'

module Browserino
  def self.parse(user_agent)
    puts "Parsing: #{user_agent}"
    puts "before_parse:"
    before_parse.each { |b| b.call user_agent } if before_parse.any?
    puts "# => #{user_agent}"
    identities.each do |name, identity|
      puts "Checking if agent is #{name}"
      if identity.matches? user_agent
        puts "Browser is: #{identity.name}"
        puts "Browser is alias of #{identity.alias}" if identity.alias
        return analyze user_agent, identity.collectable
      end
    end
    puts 'Browser is: unknown'
  end

  def self.analyze(user_agent, *collectors)
    base = @general_collector&.properties.dup || {}
    collectors.each_with_object(base) { |c, b| b.merge! c.properties }

    base.each_with_object({}) do |(prop, pattern), result|
      match = pattern.match user_agent
      result[prop] = match && match[1]
    end
  end

  def self.define(&block)
    @tmp_identities = []

    module_eval(&block)

    @tmp_identities.each do |identity|
      identities[identity.name] = identity
    end
  end

  def self.always(&block)
    (@general_collector ||= Collector.new).define_collectors(&block)
  end

  def self.before_parse(&block)
    @before_parse ||= []
    @before_parse << block if block
    @before_parse
  end

  def self.match(pattern, &block)
    @tmp_identities << Identity.new(pattern, &block)
  end

  def self.match_alias(pattern, **opts)
    id = @tmp_identities.select { |id| id == opts[:to] }.first

    raise "No alias found for: #{opts[:to] || 'nil'}" unless id

    definition = Identity.new(pattern) do
      name      opts[:name] || id.name
      type      opts[:type] || id.type
      collector opts[:collector] || id.collector
      alias_of  id.name
    end

    @tmp_identities << definition
  end

  def self.identities
    @identities ||= {}
  end
end
