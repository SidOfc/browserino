require 'spec_helper'
require 'user_agents'

describe "returns #{VISIBLE_FOR_UNKNOWN} when information couldn't be found" do
  agent = Browserino::parse('', UserAgents::USE_FOR_UNKNOWN)

  it "Returns #{VISIBLE_FOR_UNKNOWN} for agent.browser_name" do
    expect(agent.browser_name).to eq UserAgents::USE_FOR_UNKNOWN
  end

  it "Returns #{VISIBLE_FOR_UNKNOWN} for agent.browser_version" do
    expect(agent.browser_version).to eq UserAgents::USE_FOR_UNKNOWN
  end

  it "Returns #{VISIBLE_FOR_UNKNOWN} for agent.engine_name" do
    expect(agent.engine_name).to eq UserAgents::USE_FOR_UNKNOWN
  end

  it "Returns #{VISIBLE_FOR_UNKNOWN} for agent.engine_version" do
    expect(agent.engine_version).to eq UserAgents::USE_FOR_UNKNOWN
  end

  it "Returns [" + VISIBLE_FOR_UNKNOWN.to_s + ", " + VISIBLE_FOR_UNKNOWN.to_s + "] for agent.system_name({full: true})" do
    expect(agent.system_name(full: true)).to eq [UserAgents::USE_FOR_UNKNOWN, UserAgents::USE_FOR_UNKNOWN]
  end

  it "Returns #{VISIBLE_FOR_UNKNOWN} for agent.system_name" do
    expect(agent.system_name).to eq UserAgents::USE_FOR_UNKNOWN
  end

  it "Returns #{VISIBLE_FOR_UNKNOWN} for agent.system_version" do
    expect(agent.system_version).to eq UserAgents::USE_FOR_UNKNOWN
  end

  it "Returns #{VISIBLE_FOR_UNKNOWN} for agent.system_architecture" do
    expect(agent.system_architecture).to eq UserAgents::USE_FOR_UNKNOWN
  end

  it "Returns false for agent.known?" do
    expect(agent.known?).to eq false
  end

  it "Returns true for agent.not.known?" do
    expect(agent.not.known?).to eq true
  end

  it "Returns false for agent.x32?" do
    expect(agent.x32?).to eq false
  end

  it "Returns true for agent.not.x32?" do
    expect(agent.not.x32?).to eq true
  end

  it "Returns false for agent.x64?" do
    expect(agent.x64?).to eq false
  end

  it "Returns true for agent.not.x64?" do
    expect(agent.not.x64?).to eq true
  end

  it "Returns false for agent.bot?" do
    expect(agent.bot?).to eq false
  end

  it "Returns true for agent.not.bot?" do
    expect(agent.not.bot?).to eq true
  end
end
