module Browserino
  class Agent
    def initialize(ua, unknown = Browserino::UNKNOWN)
      @ua = ua
      @unknown = unknown
      @not = false

      cleansed_ua = Browserino::cleanse @ua
      name = Browserino::find_browser_name cleansed_ua
      @info = Browserino::check_for_aliases({
        browser_name: name,
        browser_version: Browser::version(cleansed_ua, PATTERNS[:browser][name]),
        engine_name: Engine::name(cleansed_ua),
        engine_version: Engine::version(cleansed_ua),
        system_name: OperatingSystem::name(cleansed_ua),
        system_version: OperatingSystem::version(cleansed_ua),
        system_architecture: OperatingSystem::architecture(cleansed_ua)
      })
    end

    def browser_name
      with_valid(@info[:browser_name]) do |v|
        v.to_s.downcase.gsub(/_/, ' ')
      end
    end

    def browser_version
      with_valid(@info[:browser_version]) do |v|
        v.to_s.downcase.gsub('_', '.')
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

    def ua
      @ua
    end

    def known?
      browser_name != @unknown
    end

    def mobile?
      !!(ua =~ /bolt|nokia|samsung|mobi(?:le)?|android|ip(?:[ao]d|hone)|bb\d+|blackberry|iemobile|fennec|bada|meego|vodafone|t\-mobile|opera\sm(?:ob|in)i/i)
    end

    def x64?
      system_architecture == 'x64'
    end

    def x32?
      system_architecture == 'x32'
    end

    def correct_system?(name, version = nil)
      os_equal = (name == system_name)
      if version
        os_equal && version == system_version.to_s[0..(version.size - 1)]
      else
        os_equal
      end
    end

    def correct_browser?(name, version = nil)
      browser_equal = (name.gsub(/_/, ' ') == browser_name)
      if version
        browser_equal && version == browser_version.to_s[0..(version.size - 1)]
      else
        browser_equal
      end
    end

    def method_missing(method_sym, *args, &block)
      criteria = method_sym.to_s.gsub('?', '').split(/(?<=[a-zA-Z_])(?=\d+)/)
      name = criteria[0]
      res = case browser_or_system?(method_sym)
      when :system then correct_system?(criteria[0], criteria[1])
      when :browser then correct_browser?(criteria[0], criteria[1])
      else super
      end
      if @not
        @not = false
        !res
      else
        res
      end
    end

    def respond_to?(method_sym)
      browser_or_system?(method_sym).nil? ? false : true
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

    def browser_or_system?(method_sym)
      name = method_sym.to_s.gsub('?', '').split(/(?<=[a-zA-Z])(?=\d+)/).first
      sys = Browserino::Mapping.constants(true).include?(name.upcase.to_sym)
      browser = Browserino::PATTERNS[:browser].keys.include?(name.to_sym)
      if sys
        :system
      elsif browser
        :browser
      else
        nil
      end
    end

    def with_valid(val)
      if val && (val != '' || val != false) && block_given?
        res = yield(val)
        return @unknown if res == ''
        res
      else
        @unknown
      end
    end

    def fetch_system_version_name(name)
      return @unknown if name.nil? || name == '' || !name
      const = name.upcase
      name.downcase!
      version = if system_version == @unknown
                  nil
                elsif name.match(/mac|ios/i)
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
        version_names.keys.first
      else
         @unknown
      end
    end
  end
end
