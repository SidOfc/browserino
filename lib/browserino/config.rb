# frozen_string_literal: true

module Browserino
  class Config < Options
    def define(&block)
      instance_eval(&block)
      matchers.each_with_object types do |mtch, types_arr|
        types_arr << mtch.type unless types_arr.include?(mtch.type)
      end
    end

    def prop_missing(name, &block)
      missing_props[name] = block
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
      opts = @tmp_defaults.merge opts if @tmp_defaults.is_a? Hash

      if rgxp && opts[:like]
        matchers.unshift with_alias(rgxp, opts, &block)
      elsif rgxp
        matchers << Matcher.new(rgxp, opts, &block).freeze
      else
        global_matchers.unshift Matcher.new(&block).freeze
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
      @preset_store ||= []
      @preset_store << props if @preset_store.empty?
      @preset_store << @tmp_defaults.merge(props) if @tmp_defaults
      @tmp_defaults = @preset_store.last

      instance_eval(&block)

      @preset_store.pop
      @tmp_defaults = @preset_store.last
    end

    # the order of these methods is the same as seen at the top of the
    # definitions/matchers.rb file. It is the current "order" required
    # for Browserino to work properly, maybe tweaking some regexes can lighten
    # this up but it's OK for now.
    def emails(opts = {}, &block)
      preset opts.merge(type: :email), &block
    end

    def browsers(opts = {}, &block)
      preset opts.merge(type: :browser), &block
    end

    def like(tmp, opts = {}, &block)
      preset opts.merge(like: tmp.to_sym), &block
    end

    def rss(opts = {}, &block)
      preset opts.merge(type: :rss), &block
    end

    def bots(opts = {}, &block)
      preset opts.merge(type: :bot, text: true), &block
    end

    def validators(opts = {}, &block)
      preset opts.merge(type: :validator, text: true), &block
    end

    def libraries(opts = {}, &block)
      preset opts.merge(type: :library, text: true), &block
    end

    def with_alias(pattern, **opts, &block)
      alt = matchers.select { |id| id == opts[:like] }.first

      raise "No alias found for: #{opts[:like] || 'nil'}" unless alt

      base = alt.properties
      if (excl = opts.delete(:except))
        base = base.reject { |k| excl.include? k }
      end

      Matcher.new(pattern, base.merge(opts), &block).freeze
    end
  end
end
