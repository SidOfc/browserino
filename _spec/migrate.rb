require 'pry'
require 'yaml'
require_relative 'user_agents'
require_relative 'user_agents_bots'

short  = UserAgents::Bots
consts = short.constants(true) - [:USE_FOR_UNKNOWN]
out = []
consts.each do |const|
  tmp = short.const_get(const).map do |ua, data|
    { user_agent: ua,
      name: data[:name]&.downcase.strip&.gsub(/[\s-]/i, '_').to_sym }
  end

  out.concat tmp
end

yaml = { bots: out }.to_yaml

puts yaml
