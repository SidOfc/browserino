USE_FOR_UNKNOWN = false
VISIBLE_FOR_UNKNOWN = 'false'

require 'spec_helper'
require 'user_agents'

describe Browserino do
  it 'has a version number' do
    expect(Browserino::VERSION).not_to be nil
  end

  it 'contains hash keys to determine every major browser' do
    @major_browsers = [:opera, :ie, :firefox, :chrome, :safari]
    expect((Browserino::PATTERNS[:browser].keys & @major_browsers).empty?).to eq(false)
  end
end

UserAgents.constants(true).each do |const|
  UserAgents.const_get(const).each do |platform|
    unless (platform[1] || []).empty?
      platform[1].each do |agent, criteria|
        describe "#{const} -> #{agent}" do
          agent = Browserino::parse(agent, USE_FOR_UNKNOWN)
          it 'returns an Agent object' do
            expect(agent.class.name).to eq 'Browserino::Agent'
          end
          criteria.each do |property, value|
            if (property == :system_name)
              it "expects #{property}({full: true}) to be #{value} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property, {full: true}).to_s.downcase).to eq value.to_s.downcase
              end
              it "expects #{property} to be #{value.first} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property).to_s.downcase).to eq value.first.to_s.downcase
              end
            else
              it "expects #{property} to be #{value} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property).to_s.downcase).to eq value.to_s.downcase
              end
            end
          end
          describe "Implements method_missing? for" do
            sys_nm = agent.system_name.to_s.downcase
            sys_ver = (agent.system_version || '').split('.').first
            if agent.system_name != USE_FOR_UNKNOWN
              it "system names w/o version: agent.#{sys_nm}?" do
                expect(agent.send("#{sys_nm}?")).to eq true
              end
            end
            if agent.browser_name != USE_FOR_UNKNOWN
              browser_nm = agent.browser_name.to_s.downcase
              browser_ver = (agent.browser_version || '').split('.').first
              it "browser names w/o version: agent.#{browser_nm}?" do
                expect(agent.send("#{browser_nm}?")).to eq true
              end
              if browser_ver
                it "browser names w/ version: agent.#{browser_nm + browser_ver}?" do
                  expect(agent.send("#{browser_nm + browser_ver}?")).to eq true
                end
              end
            end
          end
        end
      end
    end
  end
end

describe "returns #{USE_FOR_UNKNOWN} when information couldn't be found" do
  agent = Browserino::parse('', USE_FOR_UNKNOWN)

  it "Returns '#{VISIBLE_FOR_UNKNOWN}' for agent.browser_name" do
    expect(agent.browser_name).to eq USE_FOR_UNKNOWN
  end

  it "Returns '#{VISIBLE_FOR_UNKNOWN}' for agent.browser_version" do
    expect(agent.browser_version).to eq USE_FOR_UNKNOWN
  end

  it "Returns '#{VISIBLE_FOR_UNKNOWN}' for agent.engine_name" do
    expect(agent.engine_name).to eq USE_FOR_UNKNOWN
  end

  it "Returns '#{VISIBLE_FOR_UNKNOWN}' for agent.engine_version" do
    expect(agent.engine_version).to eq USE_FOR_UNKNOWN
  end

  it 'Returns [' + VISIBLE_FOR_UNKNOWN.to_s + ', ' + VISIBLE_FOR_UNKNOWN.to_s + '] for agent.system_name({full: true})' do
    expect(agent.system_name(full: true)).to eq [USE_FOR_UNKNOWN, USE_FOR_UNKNOWN]
  end

  it "Returns '#{VISIBLE_FOR_UNKNOWN}' for agent.system_name" do
    expect(agent.system_name).to eq USE_FOR_UNKNOWN
  end

  it "Returns '#{VISIBLE_FOR_UNKNOWN}' for agent.system_version" do
    expect(agent.system_version).to eq USE_FOR_UNKNOWN
  end

  it "Returns '#{VISIBLE_FOR_UNKNOWN}' for agent.system_architecture" do
    expect(agent.system_architecture).to eq USE_FOR_UNKNOWN
  end
end
