module Browserino
  class Agent
    def initialize(ua, unknown = Browserino::UNKNOWN)
      @ua = ua
      @not = false

      cleansed_ua = Browserino::strip_lies @ua
      name = Browserino::agent_id cleansed_ua
      info = {
        browser_name: name,
        browser_version: Browser::version(cleansed_ua, PATTERNS[:browser][name]),
        engine_name: Engine::name(cleansed_ua),
        engine_version: Engine::version(cleansed_ua),
        system_name: OperatingSystem::name(cleansed_ua),
        system_version: OperatingSystem::version(cleansed_ua),
        system_architecture: OperatingSystem::architecture(cleansed_ua),
        locale: OperatingSystem::locale(cleansed_ua),
        bot_name: nil
      }

      if Browserino::PATTERNS[:bot].include? name
        info.merge!({browser_name: nil, browser_version: nil, bot_name: name})
      end

      @info = Browserino::check_for_aliases(info)
    end

    def browser_name
      with_valid(@info[:browser_name]) do |v|
        v.to_s.downcase.gsub(/_/, ' ')
      end
    end

    def browser_version(opts = {})
      if ie? && engine_version && !opts[:compat]
        (engine_version.to_f + 4.0).to_s
      else
        with_valid(@info[:browser_version]) do |v|
          v.to_s.downcase.gsub('_', '.')
        end
      end
    end

    def engine_name
      with_valid(@info[:engine_name]) do |v|
        v.to_s.downcase
      end
    end

    def engine_version
      with_valid(@info[:engine_version]) do |v|
        v.to_s.downcase.gsub('_', '.')
      end
    end

    def system_name(opts = {})
      opts = {full: false}.merge(opts)
      name = with_valid(@info[:system_name]) do |v|
        v.to_s.downcase
      end
      if opts[:full]
        [name, fetch_system_version_name(name)]
      else
        name
      end
    end

    def system_version
      with_valid(@info[:system_version]) do |v|
        v.to_s.downcase.gsub('_', '.')
      end
    end

    def system_architecture
      with_valid(@info[:system_architecture]) do |v|
        v.to_s.downcase
      end
    end

    def locale
      with_valid(@info[:locale]) { |v| v.to_s.downcase }
    end

    def bot_name
      with_valid(@info[:bot_name]) do |v|
        v.to_s.downcase.gsub(/_/, ' ')
      end
    end

    def ua
      @ua
    end

    def compat?
      allow_inverted_return (ie? && browser_version != browser_version(compat: true))
    end

    def known?
      allow_inverted_return (browser_name != Browserino::UNKNOWN || bot_name != Browserino::UNKNOWN)
    end

    def mobile?
      allow_inverted_return !!(ua =~ Browserino::PATTERNS[:operating_system][:mobile])
    end

    def x64?
      allow_inverted_return system_architecture == 'x64'
    end

    def x32?
      allow_inverted_return system_architecture == 'x32'
    end

    def osx?(*arg)
      allow_inverted_return macintosh?(*arg)
    end

    def win?(*arg)
      allow_inverted_return windows?(*arg)
    end

    def bb?(*arg)
      allow_inverted_return blackberry?(*arg)
    end

    def bot?(name = nil)
      is_bot = ((bot_name.nil? ? false : true) ? true : ua.strip.empty?)
      is_name = (name.nil? ? true : (name.to_s.downcase.gsub(/_/, ' ') == bot_name))
      allow_inverted_return (is_bot && is_name)
    end

    def method_missing(method_sym, *args, &block)
      name = method_sym.to_s.gsub('?', '')
      res = case agent_or_system?(method_sym)
      when :system then correct_system?(name, *args)
      when :agent then correct_agent?(name, *args)
      else super
      end
      allow_inverted_return res
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
        case k
        when :system_version
          system_name + sep + send(k).to_s.split('.').first.to_s
        when :engine_version
          engine_name + sep + send(k).to_s.split('.').first.to_s
        when :browser_version
          browser_name + sep + send(k).to_s.split('.').first.to_s
        else send(k)
        end
      end
      props.compact.map { |v| v.gsub(/\s/, '-') }.join(' ')
    end

    def to_a
      @info.inject([]) do |memo, arr|
        memo.push [arr.first, send(arr.first)]
        memo
      end
    end

    def to_h
      to_a.inject({}) do |memo, arr|
        memo[arr[0].to_sym] = arr[1]
        memo
      end
    end

    private

    def allow_inverted_return(res)
      if @not
        @not = false
        !res
      else
        res
      end
    end

    def compare_versions(a, b)
      b = b.to_s.split('.')
      !a.to_s.split('.').map { |v| v == b.shift }.include?(false)
    end

    def correct_system?(name, version = nil)
      sys_name = name.to_s.downcase.gsub(/\s/, '_')
      sys_name_compare = system_name(full: true).join.downcase.gsub(/\s/, '_')
      name_variations = [sys_name_compare, sys_name_compare.gsub(/^[\s_]+|[\d\.\s_]+$/, '')]
      if (name_variations.include?((sys_name + version.to_s).gsub(/\s/, '_').downcase) ||
          (sys_name == system_name.gsub(/\s/, '_') && compare_versions(version, system_version)) ||
          (!version && sys_name == system_name.gsub(/\s/, '_')))
        true
      else
        false
      end
    end

    def correct_agent?(name, version = nil)
      name = name.gsub(/_/, ' ')
      browser_equal = (name == browser_name || name == bot_name)
      if version
        browser_equal && compare_versions(version, browser_version)
      else
        browser_equal
      end
    end

    def agent_or_system?(method_sym)
      name = method_sym.to_s.gsub('?', '')
      sys = Browserino::Mapping.constants(true).include?(name.upcase.to_sym)
      agent = Browserino::PATTERNS[:browser].merge(Browserino::PATTERNS[:bot]).keys.include?(name.to_sym)
      if sys
        :system
      elsif agent
        :agent
      else
        nil
      end
    end

    def with_valid(val)
      if val && (val != '' || val != false) && block_given?
        res = yield(val)
        return Browserino::UNKNOWN if res == ''
        res
      else
        Browserino::UNKNOWN
      end
    end

    def fetch_system_version_name(name)
      return Browserino::UNKNOWN if name.nil? || name == '' || !name
      const = name.upcase.gsub(/\s/, '_')
      name.downcase!
      version = if system_version == Browserino::UNKNOWN
                  nil
                elsif name.match(/mac|ios|blackberry/i)
                  system_version.split('.').first(2).join.to_i
                elsif name.match(/win|android/i)
                  system_version.gsub('.', '').to_i
                else
                  system_version.to_i
                end
      if version && defined? const
        version_names = Browserino::Mapping.const_get(const).select do |_, versions|
          true if versions.include?(version)
        end
        version_names.keys.first || system_version.split('.').first(2).join('.')
      else
         Browserino::UNKNOWN
      end
    end
  end
end
