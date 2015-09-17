module Browserino
  class Agent
    def initialize(hash)
      @info = hash
    end

    def browser_name
      @info[:browser][:name]
    end

    def browser_version
      @info[:browser][:version]
    end

    def engine_name
      @info[:engine][:name]
    end

    def engine_version
      @info[:engine][:version]
    end

    def system_name(full = false)
      name = @info[:operating_system][:name]
      if full
        [name, fetch_system_version_name(name)]
      else
        name
      end
    end

    def system_version
      @info[:operating_system][:version]
    end

    def system_architecture
      @info[:operating_system][:architecture]
    end

    private

    def fetch_system_version_name(name)
      codename = Browserino::Mapping.const_get(name.upcase)
      name.downcase!
      if name.start_with?('mac')
        version = system_version.split('_').first(2).join.to_i
      elsif name.start_with?('win') || name.start_with?('android')
        version = system_version.gsub('.', '').to_i
      elsif name.match(/ip((a|o)d|hone)/)
        'got ios'
      else
        'got nuttin'
      end
      if version
        codename.select { |k, v| v if k.include?(version) }.values.first
      end
    end
  end
end
