# frozen_string_literal: true
module Browserino
  class Config < Options
    def define(&block)
      instance_eval(&block)

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
        identities << Identity.new(rgxp, opts, &block).freeze
      else
        global_identities.unshift Identity.new(&block).freeze
      end
    end

    def alias_for(name, *names)
      aliasses[name] += names
    end

    def before_parse(&block)
      @options[:before_parse] << block if block
      @options[:before_parse]
    end

    def preset(props, &block)
      @tmp_defaults = props
      instance_eval(&block)
      @tmp_defaults = nil
    end

    def like(tmp, opts = {}, &block)
      preset opts.merge(like: tmp.to_sym), &block
    end

    def validators(&block)
      preset type: :validator, &block
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

      base = id.properties
      if (excl = opts.delete(:except))
        base = base.reject { |k| excl.include? k }
      end

      Identity.new(pattern, base.merge(opts), &block).freeze
    end
  end
end
