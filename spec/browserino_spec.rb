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
          out = Browserino::parse(agent).to_h
          criteria.each do |property, value|
            it "expects #{property} to be #{value} for #{const.downcase} on #{platform[0]}" do
              expect(out[property].to_s).to eq value.to_s.downcase
            end
          end
        end
      end
    end
  end
end
