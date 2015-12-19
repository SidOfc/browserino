module Browserino
  class Agent
    def initialize(hash, unknown = Browserino::UNKNOWN)
      @info = hash
      @unknown = unknown
      @not = false
    end

    def browser_name
      with_valid(@info[:browser_name]) { |v| v.to_s.downcase }
    end

    def browser_version
      with_valid(@info[:browser_version]) { |v| v.to_s.downcase.gsub('_', '.') }
    end

    def engine_name
      with_valid(@info[:engine_name]) { |v| v.to_s.downcase }
    end

    def engine_version
      with_valid(@info[:engine_version]) { |v| v.to_s.downcase.gsub('_', '.') }
    end

    def system_name(opts = {})
      opts = {full: false}.merge(opts)
      name = with_valid(@info[:system_name]) { |v| v.to_s.downcase }
      if opts[:full]
        [name, fetch_system_version_name(name)]
      else
        name
      end
    end

    def system_version
      with_valid(@info[:system_version]) { |v| v.to_s.downcase.gsub('_', '.') }
    end

    def system_architecture
      with_valid(@info[:system_architecture]) { |v| v.to_s.downcase }
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
      browser_equal = (name == browser_name)
      if version
        browser_equal && version == browser_version.to_s[0..(version.size - 1)]
      else
        browser_equal
      end
    end

    def method_missing(method_sym, *args, &block)
      criteria = method_sym.to_s.gsub('?', '').split(/(?<=[a-zA-Z])(?=\d+)/)
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
      browser_or_system?(method_sym).nil?
    end

    def not
      @not = true
      self
    end

    def to_s
      props = @info.map do |k, _v|
        res = send k
        case k
        when :system_version
          system_name + res.to_s.split('.').first.to_s
        when :engine_version
          engine_name + res.to_s.split('.').first.to_s
        when :browser_version
          browser_name + res.to_s.split('.').first.to_s
        else res
        end
      end
      props.compact.join(' ')
    end

    def to_a
      @info.inject([]) do |memo, arr|
        memo.push [arr.first, send(arr.first)]
        memo
      end
    end

    def to_h
      to_a.to_h
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
