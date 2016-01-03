require 'spec_helper'
require 'user_agents'
require 'user_agents_bots'

describe "Browserino Bot identification" do
  bots = UserAgents::Bots.constants(true)
  bots.each do |bot|
    UserAgents::Bots.const_get(bot).each do |ua, criteria|
      agent = Browserino::parse ua
      describe ua do
        criteria.each do |prop, val|
          if prop == :bot_name
            it "Expects agent.#{prop} to be #{val} for #{bot}" do
              expect(agent.send(prop).downcase).to eq val.downcase
            end
            it "Expects agent.#{val}? to be true for #{bot}" do
              expect(agent.send("#{val.downcase.gsub(/\s/, '_')}?")).to eq true
            end
            it "Expects agent.not.#{val}? to be false for #{bot}" do
              expect(agent.not.send("#{val.downcase.gsub(/\s/, '_')}?")).to eq false
            end
            (bots - [bot]).each do |const|
              it "Expects agent.not.#{const.downcase}? to be true for #{val}" do
                expect(agent.not.send("#{const.downcase}?")).to eq true
              end
            end
          else
            it "Expects agent.#{prop} to be #{val} for #{bot}" do
              expect(agent.send(prop)).to eq val
            end
          end
        end
      end
    end
  end
end
