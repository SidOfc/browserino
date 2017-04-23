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
    props = props.merge normalize(collect(left, user_agent)) if left.any?
    props = with_labels props

    if like
      repl = user_agent =~ %r{#{like}}i && '' || like.to_s
      like = parse user_agent.gsub identity.pattern, repl
    end

    Client.new props, like
  end

  def self.config
    @config ||= Config.new({ before_parse: [],
                             global_identities: [],
                             properties: [],
                             types: [:unknown],
                             names: [],
                             smart_matchers: {},
                             identities: [],
                             labels: Hash.new { |h, k| h[k] = [] },
                             filters: Hash.new { |h, k| h[k] = [] },
                             aliasses: Hash.new { |h, k| h[k] = [] } })
  end

  def self.label_for(target_name, version = nil)
    return unless config.labels.key?(target_name) && version
    version = Version.new version unless version.is_a? Version
    return unless version > 0
    config.labels[target_name].each do |candidate|
      min = Version.new candidate[:range].min
      max = Version.new candidate[:range].max

      return candidate[:name] if version >= min && version <= max
    end
    nil
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
      props[prop] ||= parse_detector detector, properties
    end
  end

  def self.parse_detector(detect, properties)
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
end
