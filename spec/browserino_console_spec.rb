require 'spec_helper'
require 'user_agents'
require 'user_agents_consoles'

describe 'Browserino console identification' do
  UserAgents::Consoles.constants(true).each do |console|
    cons_name = console.to_s.downcase
    agents = UserAgents::Consoles.const_get(console)
    agents.each do |ua, criteria|
      agent = Browserino.parse(ua)
      it "Expects agent.#{cons_name}? to equal true" do
        expect(agent.send("#{cons_name}?")).to eq true
      end
      criteria.each do |prop, val|
        case prop
        when :console_name
          it "Expects agent.#{prop} to be #{val} for #{console.downcase}" do
            expect(agent.send(prop)).to eq val
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
