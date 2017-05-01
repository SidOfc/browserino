# frozen_string_literal: true

module Browserino
  def self.analyze(ua, matcher = nil)
    @defaults ||= config.global_matchers.map(&:properties).reduce(&:merge)

    props    = @defaults.merge(matcher && matcher.properties || {})
    like     = props.delete :like
    props    = collect props, ua
    props    = collect_with_smart_watchers props, ua
    props    = with_labels props
    like     = Client.new props.merge(like_attrs(props, like, ua)) if like

    Client.new props, like
  end

  def self.like_attrs(props, like, user_agent)
    lattrs = config.matchers.select { |m| m == like }.first.properties
    fattrs = { name: like }
    fattrs[:version] = lattrs[:version] if lattrs[:version].is_a? Regexp
    fattrs[:version] ||= smart_matchers(fattrs)[:version]

    props.dup.merge collect(fattrs, user_agent)
  end

  def self.config
    @config ||= Config.new(before_parse: [],
                           global_matchers: [],
                           properties: [],
                           types: [:unknown],
                           names: [],
                           smart_matchers: {},
                           matchers: [],
                           labels: Hash.new { |h, k| h[k] = [] },
                           filters: Hash.new { |h, k| h[k] = [] },
                           aliasses: Hash.new { |h, k| h[k] = [] })
  end

  def self.label_for(target_name, version = nil)
    return unless config.labels.key?(target_name) && version
    version = Version.new version unless version.is_a? Version
    return unless version > 0
    config.labels[target_name].each do |candidate|
      return candidate[:name] if version.between? candidate[:range]
    end
    nil
  end

  def self.with_labels(properties)
    %i[name engine platform].each do |prop|
      lbl_prop = (prop == :name) && :label || "#{prop}_label".to_sym
      ver_prop = (prop == :name) && :version || "#{prop}_version".to_sym
      properties[lbl_prop] ||= label_for properties[prop], properties[ver_prop]
    end

    properties
  end

  def self.collect_with_smart_watchers(properties, user_agent)
    properties.merge collect(smart_matchers(properties), user_agent)
  end

  def self.smart_matchers(properties)
    config.smart_matchers.each_with_object({}) do |(prop, detector), props|
      next if properties.key? prop
      props[prop] = parse_detector detector, properties
    end
  end

  def self.parse_detector(detect, properties)
    pat = properties.each_with_object(detect[:with].dup) do |(key, val), str|
      replacement = val.to_s.strip.gsub '_', '[_\s-]'
      str.gsub! ":#{key}", replacement unless replacement.empty?
    end

    Regexp.new pat, get_flags(*detect[:flags].to_a)
  end

  def self.collect(properties, ua)
    properties.each_with_object({}) do |(n, v), r|
      r[n] = convert (v.is_a?(Regexp) ? v.match(ua).to_a[1] : v), format: n
    end
  end

  def self.convert(val, **opts)
    filters = config.filters[:global] + config.filters[opts[:format]]
    filters.each do |fmt|
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
