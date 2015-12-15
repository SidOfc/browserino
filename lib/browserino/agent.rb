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
      opts = {full: true}.merge(opts)
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
      if name.match(/mac|ios/i)
        version = system_version.split('.').first(2).join.to_i
      elsif name.match(/win|android/i)
        version = system_version.gsub('.', '').to_i
      end
      if version && defined? const
        Browserino::Mapping.const_get(const).select { |name, versions| true if versions.include?(version) }.keys.first
      else
         @unknown
      end
    end
  end
end
