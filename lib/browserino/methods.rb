# frozen_string_literal: true
module Browserino
  def self.analyze(user_agent, identity = nil)
    props = [*global, identity].compact.map(&:properties).reduce(&:merge)
    like  = props.delete :like if props.key? :like
    props = normalize collect(props, user_agent)
    props = with_smart_matchers props
    left  = props.select { |_, val| val.is_a? Regexp }
    props = props.merge normalize(collect(left, user_agent))
    like  = parse user_agent.gsub identity.pattern, '' if like

    Client.new props, like
  end

  def self.with_smart_matchers(properties)
    smart_matchers.each_with_object properties do |(prop, detector), props|
      props[prop] ||= detector_regex detector, properties
    end
  end

  def self.detector_regex(detect, properties)
    pat = properties.each_with_object(detect[:with].dup) do |(key, val), str|
      replacement = val.to_s.strip
      str.gsub! ":#{key}", replacement unless replacement.empty?
    end

    Regexp.new pat, get_flags(*detect[:flags].to_a)
  end

  def self.collect(properties, ua)
    properties.each_with_object({}) do |(prop, value), res|
      res[prop] = case value
                  when Regexp then value.match(ua).to_a[1]
                  else value
                  end
    end
  end

  def self.normalize(properties)
    properties.each_with_object({}) do |(prop, value), store|
      store[prop] = convert value, format: prop
    end
  end

  def self.convert(val, **opts)
    processors = Browserino.processors[:global].dup
    processors << Browserino.processors[opts[:format]]

    processors.compact.each do |fmt|
      val = fmt.call val
    end

    val
  end

  def self.get_flags(*flags)
    val = 0

    flags.each do |flag|
      case flag.to_sym
      when :m then val |= Regexp::MULTILINE
      when :i then val |= Regexp::IGNORECASE
      when :x then val |= Regexp::EXTENDED
      end
    end

    val
  end

  def self.like(tmp, &block)
    @tmp_like = tmp.to_sym
    instance_eval(&block)
    @tmp_like = nil
  end

  def self.browsers(&block)
    @tmp_type = :browser
    instance_eval(&block)
    @tmp_type = nil
  end

  def self.bots(&block)
    @tmp_type = :bot
    instance_eval(&block)
    @tmp_type = nil
  end

  def self.libraries(&block)
    @tmp_type = :library
    instance_eval(&block)
    @tmp_type = nil
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

  def self.alias_for(name, *names)
    aliasses[name] += names
  end

  def self.process(*props, &block)
    return (processors[:global] ||= []) << block unless props.any?
    props.each { |prop| processors[prop] = block }
  end

  def self.smart_match(prop, **options)
    smart_matchers[prop] = options if options[:with]
  end

  def self.match(rgxp = nil, **opts, &block)
    rgxp, opts = [nil, rgxp] if rgxp.is_a? Hash
    opts[:type] ||= @tmp_type if @tmp_type
    opts[:like] ||= @tmp_like if @tmp_like
    return add_alias(rgxp, opts, &block) if opts[:like] && rgxp
    rgxp && (@tmp_ids << Identity.new(rgxp, opts, &block)) || global(&block)
  end

  def self.add_alias(pattern, **opts, &block)
    id      = @tmp_ids.select { |id| id == opts[:like] }.first
    allowed = id.properties

    raise "No alias found for: #{opts[:like] || 'nil'}" unless id
    definition = Identity.new pattern, allowed.merge(opts), &block

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
    @names ||= []
  end

  def self.smart_matchers
    @smart_matchers ||= {}
  end

  def self.processors
    @processors ||= {}
  end

  def self.identities
    @identities ||= {}
  end

  def self.aliasses
    @aliasses ||= Hash.new { [] }
  end
end
