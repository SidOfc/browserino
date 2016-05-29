require 'spec_helper'
require 'user_agents'
require 'user_agents_consoles'

describe 'Browserino console identification' do
  UserAgents::Consoles.constants(true).each do |console|
    agents = UserAgents::Consoles.const_get(console)
    agents.each do |ua, criteria|
      agent = Browserino.parse(ua)
      criteria.each do |prop, val|
        case prop
        when :console_name
          it "Expects agent.#{prop} to be #{val} for #{console.downcase}" do
            expect(agent.send(prop).downcase).to eq val.downcase
          end
        when :console?
          it "Expects agent.#{prop} to be #{val} for #{console.downcase}" do
            expect(agent.send(prop)).to eq val
          end
        end
      end
    end
  end
end
