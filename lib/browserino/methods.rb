# frozen_string_literal: true
module Browserino
  def self.parse(user_agent)
    before_parse.each { |b| b.call user_agent } if before_parse.any?
    identities.each do |name, identity|
      if identity.matches? user_agent
        return analyze user_agent, identity
      end
    end

    analyze user_agent
  end

  def self.analyze(user_agent, identity = nil)
    base = [global_identity, identity].compact.map(&:properties).reduce(&:merge)

    properties = base.each_with_object({}) do |(prop, value), res|
      res[prop] = case value
                  when Regexp then value.match(user_agent).to_a[1]
                  else value
                  end
    end

    Agent.new (identity || global_identity), properties
  end

  def self.define(&block)
    @tmp_identities = []

    module_eval(&block)

    if @tmp_identities.any?
      @tmp_identities.each do |identity|
        property_names << identity.properties.keys
        type_names << identity.type
        names << identity.name

        identities[identity.name] = identity
      end

      property_names.flatten!.uniq!
      type_names.uniq!
      names.uniq!
    end
  end

  def self.always(&block)
    @global_identity = Identity.new //, name: nil, type: :unknown, &block
  end

  def self.before_parse(&block)
    @before_parse ||= []
    @before_parse << block if block
    @before_parse
  end

  def self.format_all(&block)
    (formatters[:global] ||= []) << block
  end

  def self.formatter(*props, &block)
    props.each { |prop| formatters[prop] = block }
  end

  def self.match(pattern, **opts, &block)
    @tmp_identities << Identity.new(pattern, opts, &block)
  end

  def self.match_alias(pattern, **opts, &block)
    id = @tmp_identities.select { |id| id == opts[:to] }.first

    raise "No alias found for: #{opts[:to] || 'nil'}" unless id

    definition = Identity.new pattern, id.properties.merge(opts), &block

    @tmp_identities.unshift definition
  end

  def self.global_identity
    @global_identity ||= Identity.new //, name: :unknown, type: :unknown, &block
  end

  def self.property_names
    @property_names ||= []
  end

  def self.type_names
    @type_names ||= []
  end

  def self.names
    @names ||= []
  end

  def self.formatters
    @formatters ||= {}
  end

  def self.identities
    @identities ||= {}
end
end
