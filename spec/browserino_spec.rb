require 'spec_helper'
require 'user_agents'
require 'user_agents_browsers'

describe Browserino do
  agent = Browserino::parse 'Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52'
  it 'has a version number' do
    expect(Browserino::VERSION).not_to be nil
  end

  it 'implements to_s' do
    expect(agent.to_s.class).to eq String
  end

  it 'implements to_a' do
    expect(agent.to_a.class).to eq Array
  end

  it 'implements to_h' do
    expect(agent.to_h.class).to eq Hash
  end

  it 'raises NoMethodError when a simulated method isn\'t supported' do
    expect { agent.fhjkshfj? }.to raise_error(NoMethodError)
  end

  it 'contains hash keys to determine every major browser' do
    @major_browsers = [:opera, :ie, :firefox, :chrome, :safari]
    expect((Browserino::PATTERNS[:browser].keys & @major_browsers).empty?).to eq(false)
  end
end
convenience_os_fn = {macintosh: :osx, windows: :win, blackberry: :bb}
browsers = UserAgents::Browsers.constants(true)
browsers.each do |const|
  UserAgents::Browsers.const_get(const).each do |platform|
    unless (platform[1] || []).empty?
      platform[1].each do |agent, criteria|
        describe "#{const} -> #{agent}" do
          agent = Browserino::parse(agent, UserAgents::USE_FOR_UNKNOWN)
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
          describe "Implements method_missing? and respond_to for" do
            sys_nm = agent.system_name.to_s.downcase
            sys_nm_full = agent.system_name(full: true)
            sys_ver_split = (agent.system_version || '').split('.')
            con = convenience_os_fn[sys_nm.to_sym]
            if agent.system_name != UserAgents::USE_FOR_UNKNOWN
              it "respond_to :#{sys_nm}?" do
                expect(agent.respond_to?("#{sys_nm}?".to_sym)).to eq true
              end
              if convenience_os_fn.keys.include?(sys_nm.to_sym)
                it "has a convenience method for calling system name" do
                  expect(agent.send("#{con}?")).to eq true
                end
              end
              it "accepts a system_name w/o version: agent.#{sys_nm}?" do
                expect(agent.send("#{sys_nm}?")).to eq true
              end
              unless sys_ver_split.empty?
                sys_ver = sys_ver_split[0..(1 + rand(0..sys_ver_split.size))].join('.')
                it "accepts a system_name w/ version: agent.#{sys_nm}?(#{sys_ver})" do
                  expect(agent.send("#{sys_nm}?", sys_ver)).to eq true
                end
                it "accepts a system_name w/ (named)version: agent.#{sys_nm}?(#{sys_nm_full[1]})" do
                  expect(agent.send("#{sys_nm}?", sys_nm_full[1])).to eq true
                end
                if convenience_os_fn.keys.include?(sys_nm.to_sym)
                  it "has a convenience method for calling system name w/ version agent.#{con}?(#{sys_ver})" do
                    expect(agent.send("#{con}?", sys_ver)).to eq true
                  end
                  it "has a convenience method for calling system name w/ (named)version agent.#{con}?(#{sys_nm_full[1]})" do
                    expect(agent.send("#{con}?", sys_nm_full[1])).to eq true
                  end
                end
              end
            end
            if agent.browser_name != UserAgents::USE_FOR_UNKNOWN
              browser_nm = agent.browser_name.to_s.downcase.gsub(/\s/, '_')
              browser_ver = (agent.browser_version || '').split('.').first
              it "respond_to :#{browser_nm}?" do
                expect(agent.respond_to?("#{browser_nm}?".to_sym)).to eq true
              end
              it "accepts a browser_name w/o version: agent.#{browser_nm}?" do
                expect(agent.send("#{browser_nm}?")).to eq true
              end
              if browser_ver
                it "accepts a browser_name w/ version: agent.#{browser_nm}?(#{browser_ver})" do
                  expect(agent.send("#{browser_nm}?", browser_ver)).to eq true
                end
              end
            end
          end
          describe "Correctly inverts method_missing? results when #not is called" do
            if agent.browser_name != UserAgents::USE_FOR_UNKNOWN
              browser_nm = agent.browser_name.to_s.downcase.gsub(/\s/, '_')
              it 'returns false for not being itself' do
                expect(agent.not.send("#{browser_nm}?")).to eq false
              end

              describe 'returns true for any random others' do
                brwsrs = browsers.dup - [browser_nm.upcase.to_sym]
                brwsrs.each do |b|
                  bb = b.to_s.downcase.gsub(/\s/, '_')
                  it "returns true for agent.not.#{bb}?" do
                    expect(agent.not.send("#{bb}?")).to eq true
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
