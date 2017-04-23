# frozen_string_literal: true
module Browserino
  def self.analyze(user_agent, identity = nil)
    @defaults ||= config.global_identities.map(&:properties).reduce(&:merge)

    props = @defaults.merge(identity && identity.properties || {})
    like  = props.delete :like
    props = collect props, user_agent
    props = props.merge collect(smart_matchers(props), user_agent)
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

  def self.smart_matchers(properties)
    config.smart_matchers.each_with_object({}) do |(prop, detector), props|
      next if properties.key? prop
      props[prop] = parse_detector detector, properties
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
