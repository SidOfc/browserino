module Browserino
  class Agent
    include Core::Helpers, Core::Questions
    attr_reader :ua

    def initialize(info, ua = nil)
      @ua = ua
      @not = false
      @info = post_process(info)
    end

    def name
      @info[:name]
    end

    alias_method :browser_name, :name
    alias_method :bot_name, :name
    alias_method :search_engine_name, :name
    alias_method :social_media_name, :name

    def browser_version(opts = {})
      if ie? && engine_version && !opts[:compat]
        (engine_version.to_f + 4.0).to_s
      else
        @info[:browser_version]
      end
    end

    def engine_name
      @info[:engine_name]
    end

    def engine_version
      @info[:engine_version]
    end

    def system_name(opts = {})
      if opts[:full]
        @full_sys_name ||= [@info[:system_name],
                            fetch_system_version_name(@info[:system_name])]
      else
        @info[:system_name]
      end
    end

    alias_method :console_name, :system_name

    def system_version
      @info[:system_version]
    end

    def system_architecture
      @info[:system_architecture]
    end

    def locale
      @info[:locale]
    end

    def not
      @not = true
      self
    end

    def to_console_s
      hash_for_to_s.each_with_object('') do |pair, a|
        a << "\e[1;32;49m#{pair[0]}:\e[0m "
        a << "\e[1;95;49m#{(pair[1] == '' ? 'nil' : pair[1])}\e[0m, "
      end[0..-3]
    end

    def to_s(sep = '')
      prev = ''
      s = hash_for_to_s.each_with_object([]) do |v, a|
        a << case v[0]
             when :browser_version, :engine_version
               prev + sep + (v[1].split('.').first || '')
             else v[1]
             end
        prev = v[1]
      end
      s.uniq.reject { |str| str == '' }.join ' '
    end

    def hash_for_to_s
      out = to_h.each_with_object({}) do |a, h|
        h[a[0]] = a[1].to_s.gsub(/[\s_]/, '-')
      end
      [:locale, :system_version].each { |k| out.delete(k) }
      out
    end

    def to_a
      @info.keys.each_with_object([]) { |f, a| a.push([f, send(f)]) }.compact
    end

    def to_h
      to_a.each_with_object({}) { |a, h| h[a[0]] = a[1] }
    end

    def method_missing(method_sym, *args, &block)
      name = method_sym.to_s.tr('?', '')
      invertable case agent_or_system?(method_sym)
                 when :system then correct_system?(name, *args)
                 when :agent then correct_agent?(name, *args)
                 else super
                 end
    end

    def respond_to?(method_sym, *args, &block)
      agent_or_system?(method_sym).nil? ? false : true
    end

    private

    def post_process(h)
      case h[:name]
      when 'edge'
        h[:engine_name] = 'edgehtml'
        h[:engine_version] = h[:browser_version].to_s.split('.').shift.to_s
      when 'ie'
        h[:engine_name] = 'trident'
      end
      h
    end
  end
end
