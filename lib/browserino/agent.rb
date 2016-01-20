module Browserino
  class Agent
    include Core::Helpers
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

    def compat?
      invert_if_not ie? && browser_version != browser_version(compat: true)
    end

    def known?
      invert_if_not !browser_name.nil? || !bot_name.nil?
    end

    def mobile?
      invert_if_not !ua.match(Core::PATTERNS[:operating_system][:mobile]).nil?
    end

    def x64?
      invert_if_not system_architecture == 'x64'
    end

    def x32?
      invert_if_not system_architecture == 'x32'
    end

    def osx?(*arg)
      invert_if_not macintosh?(*arg)
    end

    def win?(*arg)
      invert_if_not windows?(*arg)
    end

    def bb?(*arg)
      invert_if_not blackberry?(*arg)
    end

    def bot?(name = nil)
      is_bot = ua.strip.empty? || !bot_name.nil?
      is_name = name.nil? || name.to_s.downcase.tr('_', ' ') == bot_name
      invert_if_not is_bot && is_name
    end

    def method_missing(method_sym, *args, &block)
      name = method_sym.to_s.tr('?', '')
      invert_if_not case agent_or_system?(method_sym)
                    when :system then correct_system?(name, *args)
                    when :agent then correct_agent?(name, *args)
                    else super
                    end
    end

    def respond_to?(method_sym)
      agent_or_system?(method_sym).nil? ? false : true
    end

    def not
      @not = true
      self
    end

    def to_s(sep = '')
      props = @info.map do |k, _|
        y = [:system_version, :engine_version, :browser_version].include?(k)
        y ? send(k) + sep + send(k).to_s.split('.').first : send(k)
      end
      props.compact.map { |v| v.tr(' ', '-') }.join(' ')
    end

    def to_a
      @info.each_with_object([]) { |v, a| a.push(v) }
    end

    def to_h
      to_a.each_with_object({}) { |v, h| h[v[0].to_sym] = v[1] }
    end
  end
end
