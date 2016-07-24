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

    def browser_version(opts = {})
      if ie? && engine_version && !opts[:compat]
        (engine_version.to_f + 4.0).to_s
      else
        @info[:browser_version]
      end
    end

    def library_version
      @info[:browser_version]
    end

    def library_name
      @info[:name]
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

    def system_version
      @info[:system_version]
    end

    def system_architecture
      @info[:system_architecture]
    end

    def console_name
      @info[:console_name]
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

    def to_a
      @info.keys.each_with_object([]) { |f, a| a.push([f, send(f)]) }
    end

    def to_h
      to_a.each_with_object({}) { |a, h| h[a[0]] = a[1] }
    end

    def method_missing(method_sym, *args, &block)
      name = method_sym.to_s.tr('?', '')
      invertable case type_id(method_sym)
                 when :system then correct_system? name, *args
                 when :agent then correct_agent? name, *args
                 when :console then correct_console? name
                 when :library then correct_library? name, *args
                 else super
                 end
    end

    def respond_to?(method_sym, *args, &block)
      type_id(method_sym).nil? ? false : true
    end
  end
end
