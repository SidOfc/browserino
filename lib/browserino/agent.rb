module Browserino
  class Agent
    attr_accessor :info

    def initialize(hash)
      @info = hash
    end

    def browser_name
      @info[:browser_name].downcase
    end

    def browser_version
      @info[:browser_version].gsub('_', '.').downcase
    end

    def engine_name
      @info[:engine_name].downcase
    end

    def engine_version
      @info[:engine_version].gsub('_', '.').downcase
    end

    def system_name(opts = {})
      opts = {full: true}.merge(opts)
      name = @info[:system_name].downcase
      if opts[:full]
        [name, fetch_system_version_name(name).downcase]
      else
        name
      end
    end

    def system_version
      @info[:system_version].gsub('_', '.').downcase
    end

    def system_architecture
      @info[:system_architecture].downcase
    end

    private

    def fetch_system_version_name(name)
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
        'unknown'
      end
    end
  end
end
