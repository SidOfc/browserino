# frozen_string_literal: true
module Browserino
  def self.analyze(user_agent, identity = nil)
    props = [*config.global_identities, identity].compact.map(&:properties)
                                                 .reduce(&:merge)
    like  = props.delete :like if props.key? :like
    props = collect(props, user_agent)
    props = normalize props
    props = with_smart_matchers props
    left  = props.select { |_, val| val.is_a? Regexp }
    props = props.merge normalize(collect(left, user_agent))
    props = with_labels props
    like  = parse user_agent.gsub identity.pattern, '' if like
    Client.new props, like
  end

  def self.config
    @config ||= Config.new({ global_identities: [],
                             properties: [],
                             types: [:unknown],
                             names: [],
                             smart_matchers: {},
                             identities: [],
                             labels: Hash.new { |h, k| h[k] = [] },
                             filters: Hash.new { |h, k| h[k] = [] },
                             aliasses: Hash.new { |h, k| h[k] = [] } })
    @config
  end

  def self.with_labels(properties)
    [:name, :engine, :platform].each do |prop|
      lbl_prop = (prop == :name) && :label || "#{prop}_label".to_sym
      ver_prop = (prop == :name) && :version || "#{prop}_version".to_sym
      properties[lbl_prop] ||= label_for properties[prop], properties[ver_prop]
    end

    properties
  end

  def self.with_smart_matchers(properties)
    config.smart_matchers.each_with_object properties do |(prop, detector), props|
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
    filters = config.filters[:global] + config.filters[opts[:format]]
    filters.compact.each do |fmt|
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
    module_eval(&block)
    @tmp_like = nil
  end

  def self.browsers(&block)
    @tmp_type = :browser
    module_eval(&block)
    @tmp_type = nil
  end

  def self.bots(&block)
    @tmp_type = :bot
    module_eval(&block)
    @tmp_type = nil
  end

  def self.libraries(&block)
    @tmp_type = :library
    module_eval(&block)
    @tmp_type = nil
  end

  def self.define(&block)
    @tmp_ids = []

    module_eval(&block)
    return unless @tmp_ids.any?

    @tmp_ids.each do |identity|
      config.properties << identity.properties.keys
      config.types << identity.type
      config.names << identity.name

      identities[identity.name] = identity
    end

    config.properties.flatten!.uniq!
    config.types.uniq!
    config.names.uniq!
  end

  def self.before_parse(&block)
    @before_parse ||= []
    @before_parse << block if block
    @before_parse
  end

  def self.alias_for(name, *names)
    config.aliasses[name] += names
  end

  def self.label(name, **opts)
    return false unless opts[:for]
    opts[:name] ||= name
    config.labels[opts[:for]] << opts
  end

  def self.label_for(target_name, version = nil)
    return unless config.labels.key?(target_name) && version
    version = Version.new version unless version.is_a? Version
    config.labels[target_name].each do |candidate|
      min = Version.new candidate[:range].min
      max = Version.new candidate[:range].max

      return candidate[:name] if version >= min && version <= max
    end
    nil
  end

  def self.filter(*props, &block)
    props << :global unless props.any?
    props.each { |prop| config.filters[prop] << block }
  end

  def self.smart_match(prop, **options)
    config.smart_matchers[prop] = options if options[:with]
  end

  def self.match(rgxp = nil, **opts, &block)
    rgxp, opts = [nil, rgxp] if rgxp.is_a? Hash
    opts[:type] ||= @tmp_type if @tmp_type
    opts[:like] ||= @tmp_like if @tmp_like

    if rgxp && opts[:like]
      config.identities.unshift with_alias(rgxp, opts, &block)
    elsif rgxp
      config.identities << Identity.new(rgxp, opts, &block)
    else
      config.global_identities.unshift Identity.new(&block)
    end
  end

  def self.with_alias(pattern, **opts, &block)
    id = config.identities.select { |id| id == opts[:like] }.first

    raise "No alias found for: #{opts[:like] || 'nil'}" unless id

    Identity.new pattern, id.properties.merge(opts), &block
  end

  def self.global(&block)
    (@global ||= []) << Identity.new(&block)
  end

  # def self.properties
  #   config.properties
  # end
  #
  # def self.types
  #   config.types
  # end
  #
  # def self.names
  #   config.names
  # end
  #
  # def self.smart_matchers
  #   @smart_matchers ||= {}
  # end
  #
  # def self.identities
  #   @identities ||= {}
  # end
  #
  # def self.labels
  #   @labels ||= Hash.new { |h, k| h[k] = [] }
  # end
  #
  # def self.aliasses
  #   @aliasses ||= Hash.new { |h, k| h[k] = [] }
  # end
end
