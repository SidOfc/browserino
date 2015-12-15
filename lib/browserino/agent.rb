module Browserino
  class Agent
    attr_accessor :info

    def initialize(hash, unknown = Browserino::UNKNOWN)
      @info = hash
      @unknown = unknown
    end

    def browser_name
      browser_name = @info[:browser_name]
      if browser_name.nil? || browser_name == ''
        @unknown
      else
        browser_name.to_s.downcase
      end
    end

    def browser_version
      browser_ver = @info[:browser_version]
      if browser_ver.nil? || browser_ver == ''
        @unknown
      else
        browser_ver.to_s.downcase.gsub('_', '.')
      end
    end

    def engine_name
      engine_name = @info[:engine_name]
      if engine_name.nil? || engine_name == ''
        @unknown
      else
        engine_name.to_s.downcase
      end
    end

    def engine_version
      engine_ver = @info[:engine_version]
      if engine_ver.nil? || engine_ver == ''
        @unknown
      else
        engine_ver.to_s.downcase.gsub('_', '.')
      end
    end

    def system_name(opts = {})
      opts = {full: true}.merge(opts)
      tmp = @info[:system_name]
      name = (tmp == '' || tmp.nil? ? @unknown : tmp.to_s.downcase)
      if opts[:full]
        [name, fetch_system_version_name(name)]
      else
        name
      end
    end

    def system_version
      sys_ver = @info[:system_version].gsub('_', '.')
      if sys_ver.nil? || sys_ver == ''
        @unknown
      else
        sys_ver.to_s.downcase
      end
    end

    def system_architecture
      sys_arch = @info[:system_architecture]
      if sys_arch.nil? || sys_arch == ''
        @unknown
      else
        sys_arch.to_s.downcase
      end
    end

    private

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
