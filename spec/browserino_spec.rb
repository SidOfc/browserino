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

UserAgents.constants.each do |const|
  UserAgents.const_get(const).each do |platform|
    unless (platform[1] || []).empty?
      platform[1].each do |agent, criteria|
        describe agent do
          agent = Browserino::parse(agent)
          it 'returns an Agent object' do
            expect(agent.class.name).to eq 'Browserino::Agent'
          end
          criteria.each do |property, value|
            it "expects #{property} to be #{value} for #{const.downcase} on #{platform[0]}" do
              expect(agent.send(property).to_s).to eq value.to_s.downcase
            end
          end
        end
      end
    end
  end
end

describe 'Returns (string) unknown when information couldn\'t be found' do
  agent = Browserino::parse('')

  it 'Returns "unknown" for agent.browser_name' do
    expect(agent.browser_name).to eq 'unknown'
  end

  it 'Returns "unknown" for agent.browser_version' do
    expect(agent.browser_version).to eq 'unknown'
  end

  it 'Returns "unknown" for agent.engine_name' do
    expect(agent.engine_name).to eq 'unknown'
  end

  it 'Returns "unknown" for agent.engine_version' do
    expect(agent.engine_version).to eq 'unknown'
  end

  it 'Returns "unknown" for agent.system_name full: false' do
    expect(agent.system_name(full: false)).to eq 'unknown'
  end

  it 'Returns ["unknown", "unknown"] for agent.system_name' do
    expect(agent.system_name).to eq ['unknown', 'unknown']
  end

  it 'Returns "unknown" for agent.system_version' do
    expect(agent.system_version).to eq 'unknown'
  end

  it 'Returns "unknown" for agent.system_architecture' do
    expect(agent.system_architecture).to eq 'unknown'
  end
end
