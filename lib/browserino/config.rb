# frozen_string_literal: true
module Browserino
  class Config
    def initialize(options = {})
      @properties = options
    end

    def [](key)
      @properties[key]
    end

    def []=(key, value)
      @properties[key] = value
    end

    def method_missing(sym, *args, &block)
      return @properties[to_option(sym)] == args.first if args.any?
      @properties[to_option(sym)]
    end

    def respond_to_missing?(sym, *args, &block)
      option? sym
    end

    def merge(other)
      @properties.merge! other
      self
    end

    def to_hash
      @properties
    end

    def to_a
      @properties.to_a
    end

    def to_s
      @properties.to_s
    end

    def define(&block)
      instance_eval(&block)
      return unless identities.any? && identities.all?

      identities.each do |identity|
        properties << identity.properties.keys
        types      << identity.type
        names      << identity.name
      end

      properties.flatten!.uniq!
      types.uniq!
      names.uniq!
    end

    def label(name, **opts)
      return false unless opts[:for]
      opts[:name] ||= name
      labels[opts[:for]] << opts
    end

    def filter(*props, &block)
      props << :global unless props.any?
      props.each { |prop| filters[prop] << block }
    end

    def smart_match(prop, **options)
      smart_matchers[prop] = options if options[:with]
    end

    def match(rgxp = nil, **opts, &block)
      rgxp, opts = [nil, rgxp] if rgxp.is_a? Hash
      opts = @tmp_defaults.merge opts if @tmp_defaults.is_a? Hash

      if rgxp && opts[:like]
        identities.unshift with_alias(rgxp, opts, &block)
      elsif rgxp
        identities << Identity.new(rgxp, opts, &block)
      else
        global_identities.unshift Identity.new(&block)
      end
    end

    def alias_for(name, *names)
      aliasses[name] += names
    end

    def before_parse(&block)
      @properties[:before_parse] << block if block
      @properties[:before_parse]
    end

    def preset(props, &block)
      @tmp_defaults = props
      instance_eval(&block)
      @tmp_defaults = nil
    end

    def like(tmp, &block)
      preset like: tmp.to_sym, &block
    end

    def browsers(&block)
      preset type: :browser, &block
    end

    def bots(&block)
      preset type: :bot, &block
    end

    def libraries(&block)
      preset type: :library, &block
    end

    def with_alias(pattern, **opts, &block)
      id = identities.select { |id| id == opts[:like] }.first

      raise "No alias found for: #{opts[:like] || 'nil'}" unless id

      Identity.new pattern, id.properties.merge(opts), &block
    end

    private

    def to_option(sym)
      sym.to_s.tr('?', '').to_sym
    end

    def option?(sym)
      @properties.keys.include? to_option(sym)
    end
  end
end
