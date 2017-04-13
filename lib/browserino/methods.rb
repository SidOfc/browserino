# frozen_string_literal: true
module Browserino
  def self.analyze(user_agent, identity = nil)
    id   = identity || global.first
    base = [*global, identity].compact.map(&:properties).reduce(&:merge)

    properties = base.each_with_object({}) do |(prop, value), res|
      res[prop] = case value
                  when Regexp then value.match(user_agent).to_a[1]
                  else value
                  end
    end

    Agent.new({name: id.name, type: id.type}.merge(properties))
  end

  def self.define(&block)
    @tmp_ids = []

    module_eval(&block)
    return unless @tmp_ids.any?

    @tmp_ids.each do |identity|
      properties << identity.properties.keys
      types << identity.type
      names << identity.name

      identities[identity.name] = identity
    end

    properties.flatten!.uniq!
    types.uniq!
    names.uniq!
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

  def self.match(rgxp = nil, **opts, &block)
    rgxp, opts = [nil, rgxp] if rgxp.is_a? Hash
    return add_alias(rgxp, opts, &block) if opts[:like] && rgxp
    rgxp && (@tmp_ids << Identity.new(rgxp, opts, &block)) || global(&block)
  end

  def self.add_alias(pattern, **opts, &block)
    id = @tmp_ids.select { |id| id == opts[:like] }.first

    raise "No alias found for: #{opts[:like] || 'nil'}" unless id
    definition = Identity.new pattern, id.properties.merge(opts), &block

    @tmp_ids.unshift definition
  end

  def self.global(&block)
    (@global ||= []) << Identity.new(&block)
  end

  def self.properties
    @properties ||= []
  end

  def self.types
    @types ||= [:unknown]
  end

  def self.names
    @names ||= [:unknown]
  end

  def self.formatters
    @formatters ||= {}
  end

  def self.identities
    @identities ||= {}
end
end
