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

    def system_name
      @info[:system][:name]
    end

    def system_version
      @info[:system][:version]
    end

    def system_architecture
      @info[:system][:architecture]
    end
  end

end
