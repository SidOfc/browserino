module Browserino
  class Agent
    include Core::Helpers, Core::Questions
    attr_reader :ua

    def initialize(info, ua = nil)
      @ua = ua
      @not = false
      @info = info
    end

    def browser_name
      @info[:browser_name]
    end

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
        [@info[:system_name], fetch_system_version_name(@info[:system_name])]
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

    def locale
      @info[:locale]
    end

    def bot_name
      @info[:bot_name]
    end

    def not
      @not = true
      self
    end

    def to_s(sep = '')
      prev = ''
      r = except(to_h, :locale, :system_version).each_with_object([]) do |c, a|
        v = send(c[0]).to_s.gsub(/[\s_]/, '-')
        a << if prev != '' && [:browser_version, :engine_version].include?(c[0])
               prev + sep + v.to_s.split('.').first.to_s
             else
               v
             end
        prev = v
      end
      build_res_from_arr(r)
    end

    def to_a
      @info.each_with_object([]) { |v, a| a.push(v) }
    end

    def to_h
      to_a.each_with_object({}) { |v, h| h[v[0].to_sym] = v[1] }
    end

    def method_missing(method_sym, *args, &block)
      name = method_sym.to_s.tr('?', '')
      invertable case agent_or_system?(method_sym)
                 when :system then correct_system?(name, *args)
                 when :agent then correct_agent?(name, *args)
                 else super
                 end
    end

    def respond_to?(method_sym)
      agent_or_system?(method_sym).nil? ? false : true
    end
  end
end
