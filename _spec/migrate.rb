require 'yaml'
require_relative 'user_agents'
require_relative 'user_agents_browsers'

short  = UserAgents::Browsers
consts = short.constants(true) - [:USE_FOR_UNKNOWN]
out = []
consts.each do |const|
  out = short.const_get(const).values.map do |hsh|
    ua   = hsh.keys.first
    data = hsh.values.first
    { user_agent: ua, name: data[:name], engine: data[:engine_name],
      engine_version: data[:engine_version], system_name: data[:system_name]&.first.to_s.downcase,
      system_version: data[:system_version], locale: data[:locale],
      architecture: data[:system_architecture] }
  end
end

yaml = { browsers: out }.to_yaml

puts yaml
