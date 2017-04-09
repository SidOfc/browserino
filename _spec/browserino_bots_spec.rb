require 'spec_helper'
require 'user_agents'
require 'user_agents_bots'

describe "Browserino Bot identification" do
  social_media = :facebook, :twitter, :linkedin, :instagram, :pinterest, :tumblr
  search_engines = :google, :bing, :yahoo_slurp, :baiduspider, :duckduckgo
  bots = UserAgents::Bots.constants(true)
  bots.each do |bot|
    UserAgents::Bots.const_get(bot).each do |ua, criteria|
      describe "#{bot} - #{ua}" do
        agent = Browserino.parse ua
        criteria.each do |prop, val|
          if prop == :name
            it "Expects agent.#{prop} to be #{val} for #{bot.downcase}" do
              expect(agent.send(prop).downcase).to eq val.downcase
            end
            it "Expects agent.#{val}? to be true for #{bot.downcase}" do
              expect(agent.send("#{val.downcase.gsub(/\s/, '_')}?")).to eq true
            end
            it "Expects agent.not.#{val}? to be false for #{bot.downcase}" do
              expect(agent.not.send("#{val.downcase.gsub(/\s/, '_')}?")).to eq false
            end
            (bots - [bot]).sample(3).each do |const|
              it "Expects agent.not.#{const.downcase}? to be true for #{val}" do
                expect(agent.not.send("#{const.downcase}?")).to eq true
              end
            end
            if social_media.include?(val.to_sym)
              it "Expects agent.social_media? to be true" do
                expect(agent.social_media?).to eq true
              end
              it "Expects agent.social_media?(#{val}) to be true" do
                expect(agent.social_media?(val)).to eq true
              end
            elsif search_engines.include?(val.to_sym)
              it "Expects agent.search_engine? to be true" do
                expect(agent.search_engine?).to eq true
              end
              it "Expects agent.search_engine?(#{val}) to be true" do
                expect(agent.search_engine?(val)).to eq true
              end
            end
          elsif prop == :bot?
            it "Expects agent.bot?(#{criteria[:name]}) to be true for #{bot.downcase}" do
              expect(agent.bot?(criteria[:name])).to eq true
            end
            it "Expects agent.#{prop} to be #{val} for #{bot.downcase}" do
              expect(agent.send(prop)).to eq val
            end
          else
            it "Expects agent.#{prop} to be #{val} for #{bot.downcase}" do
              expect(agent.send(prop)).to eq val
            end
          end
        end
      end
    end
  end
end
