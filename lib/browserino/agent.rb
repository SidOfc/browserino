module Browserino
  class Agent
    attr_accessor :info

    def initialize(hash, unknown = Browserino::UNKNOWN)
      @info = hash
      @unknown = unknown
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

    def method_missing(method_sym, *args, &block)
      criteria = method_sym.to_s.gsub('?', '').split(/(?<=[a-zA-Z])(?=\d+)/)
      name = criteria[0]
      if respond_to? name
        os_equal = (name == system_name)
        return os_equal unless criteria.size > 1
        if criteria.size > 1
          version = criteria[1]
          os_equal && version == system_version.to_s[0..(version.size - 1)]
        else
          os_equal
        end
      else
        super
      end
    end

    def respond_to?(method_sym)
      name = method_sym.to_s.gsub('?', '').split(/(?<=[a-zA-Z])(?=\d+)/).first
      Browserino::Mapping.constants(true).include?(name.upcase.to_sym)
    end

    private

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
        Browserino::Mapping.const_get(const).select { |name, versions| true if versions.include?(version) }.keys.first
      else
         @unknown
      end
    end
  end
end
