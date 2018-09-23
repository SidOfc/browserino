# frozen_string_literal: true

module Browserino
  def self.analyze(uas, matcher = nil, headers = nil)
    @defaults ||= config.global_matchers.map(&:properties).reduce(&:merge)

    props = @defaults.merge(matcher && matcher.properties || {})
    like  = props.delete :like
    props = mass_collect props, uas

    if headers.is_a? Hash
      headers = normalize_header_keys headers
      props   = fill_missing_with_headers headers, props
    end

    props = fix_inconsistent_props props

    like = Client.new props.merge(like_attrs(props, like, uas)) if like

    Client.new props, like
  end

  def self.fix_inconsistent_props(hsh)
    # patch locale and locales props
    if hsh[:locales].any?
      # when locale is not present in locales, append it
      hsh[:locales] << hsh[:locale] unless hsh[:locales].include? hsh[:locale]

      # ensure locales.first == locale when locale present in locales
      hsh[:locale] = hsh[:locales].first
    elsif hsh[:locale]
      # no locales from header but locale is found in UA, append locale
      # to locales to ensure expected output
      hsh[:locales] << hsh[:locale]
    end

    hsh
  end

  def self.normalize_header_keys(headers)
    headers.each_with_object({}) do |(header, value), normalized|
      header = header.gsub(/^HTTP_/i, '').tr('-', '_').downcase.to_sym
      normalized[header] = value
    end
  end

  def self.fill_missing_with_headers(headers, props)
    config.missing_props.each_with_object props do |(prop, blk), res|
      if props.key?(prop) && (!props[prop] ||
         (props[prop].respond_to?(:empty?) && props[prop].empty?))
        res[prop] = convert blk.call(headers, res), format: prop
      end
    end
  end

  def self.like_attrs(props, like, user_agent)
    version = config.matchers.select { |m| m == like }
                    .first.properties[:version]
    fattrs = { name: like }
    fattrs[:version] = version if version.is_a? Regexp
    fattrs[:version] ||= smart_matchers(fattrs)[:version]

    props.dup.merge collect(fattrs, user_agent)
  end

  def self.config
    @config ||= Config.new before_parse:    [],
                           global_matchers: [],
                           properties:      [],
                           types:           [:unknown],
                           names:           [],
                           smart_matchers:  {},
                           missing_props:   {},
                           matchers:        [],
                           labels:          Hash.new { |h, k| h[k] = [] },
                           filters:         Hash.new { |h, k| h[k] = [] },
                           aliasses:        Hash.new { |h, k| h[k] = [] }
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

  def self.mass_collect(props, uas)
    props = collect props, uas
    props = collect_with_smart_watchers props, uas
    with_labels props
  end

  def self.collect(properties, uas)
    properties.each_with_object({}) do |(n, v), r|
      r[n] = convert (v.is_a?(Regexp) ? v.match(uas).to_a[1] : v), format: n
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
    flags.reduce(0) do |val, flag|
      case flag.to_sym
      when :m then val | Regexp::MULTILINE
      when :i then val | Regexp::IGNORECASE
      when :x then val | Regexp::EXTENDED
      end
    end
  end
end
