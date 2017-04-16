require 'pry'
require 'yaml'
require_relative 'user_agents'
require_relative 'user_agents_library'

short  = UserAgents::Library
consts = short.constants(true) - [:USE_FOR_UNKNOWN]
out = []
consts.each do |const|
  out += short.const_get(const).map do |ua, spec|
    { user_agent: ua, name: spec[:name].to_sym, version: spec[:library_version] }
  end
end

yaml = { libraries: out }.to_yaml
puts yaml
