module Browserino
  class Agent
    attr_accessor :info

    def initialize(hash)
      @info = hash
    end

    def browser_name
      @info[:browser_name]
    end

    def browser_version
      @info[:browser_version].gsub('_', '.')
    end

    def engine_name
      @info[:engine_name]
    end

    def engine_version
      @info[:engine_version].gsub('_', '.')
    end

    def system_name(opts = {})
      opts = {full: false}.merge(opts)
      name = @info[:system_name]
      if opts[:full]
        [name, fetch_system_version_name(name)]
      else
        name
      end
    end

    def system_version
      @info[:system_version].gsub('_', '.')
    end

    def system_architecture
      @info[:system_architecture]
    end

    private

    def fetch_system_version_name(name)
      codename = Browserino::Mapping.const_get(name.upcase)
      name.downcase!
      if name.match(/mac|ios/i)
        version = system_version.split('.').first(2).join.to_i
      elsif name.start_with?('win') || name.start_with?('android')
        version = system_version.gsub('.', '').to_i
      end
      if version
        codename.select { |k, v| v if k.include?(version) }.values.first
      end
    end
  end
end
