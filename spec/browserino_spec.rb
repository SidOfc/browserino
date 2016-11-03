require 'spec_helper'
require 'user_agents'
require 'user_agents_browsers'

convenience_os_fn = {macintosh: :osx, windows: :win, blackberry: :bb}
browsers = UserAgents::Browsers.constants(true)
browsers.each do |const|
  UserAgents::Browsers.const_get(const).each do |platform|
    unless (platform[1] || []).empty?
      platform[1].each do |agent, criteria|
        describe "#{const} -> #{agent}" do
          agent = Browserino.parse(agent)
          criteria.each do |property, value|
            if property == :system_name
              it "expects #{property}({full: true}) to be #{value} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property, {full: true}).to_s.downcase).to eq value.to_s.downcase
              end
              it "expects #{property} to be #{value.first} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property).to_s.downcase).to eq value.first.to_s.downcase
              end
            elsif property == :browser_version && agent.ie? && value.is_a?(Hash)
              it "expects #{property} to be #{value[:real]} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property).to_s.downcase).to eq value[:real].to_s.downcase
              end
              it "expects #{property}({compat: true}) to be #{value[:compat]} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property, {compat: true}).to_s.downcase).to eq value[:compat].to_s.downcase
              end
            else
              it "expects #{property} to be #{value} for #{const.downcase} on #{platform[0]}" do
                expect(agent.send(property).to_s.downcase).to eq value.to_s.downcase
              end
            end
          end
          describe "General methods" do
            sys_nm = agent.system_name.to_s.downcase
            sys_nm_full = agent.system_name(full: true)
            sys_ver_split = (agent.system_version || '').split('.')
            con = convenience_os_fn[sys_nm.to_sym]
            if agent.system_name != UserAgents::USE_FOR_UNKNOWN
              if convenience_os_fn.keys.include?(sys_nm.to_sym)
                it "has a convenience method for calling system name" do
                  expect(agent.send("#{con}?")).to eq true
                end
              end
              it "accepts a system_name without version: agent.#{sys_nm}?" do
                expect(agent.send("#{sys_nm}?")).to eq true
              end
              it "expects agent.platform? to be true" do
                expect(agent.platform?).to eq true
              end
              it "expects agent.platform?(#{sys_nm}) to be true" do
                expect(agent.platform?("#{sys_nm}")).to eq true
              end
              unless sys_ver_split.empty?
                sys_ver = sys_ver_split[0..(1 + rand(0..sys_ver_split.size))].join('.')
                it "accepts a system_name w/ version: agent.#{sys_nm}?(#{sys_ver})" do
                  expect(agent.send("#{sys_nm}?", sys_ver)).to eq true
                end
                it "returns false for an invalid system_name w/ version comparison: agent.#{sys_nm}?(#{'1' + sys_ver})" do
                  expect(agent.send("#{sys_nm}?", '1' + sys_ver)).to eq false
                end
                it "accepts a system_name w/ (named)version: agent.#{sys_nm}?(#{sys_nm_full[1]})" do
                  expect(agent.send("#{sys_nm}?", sys_nm_full[1])).to eq true
                end
                it "expects agent.platform?(#{sys_nm}, version: #{sys_ver}) to be true" do
                  expect(agent.platform?("#{sys_nm}", version: sys_ver)).to eq true
                end
                sys_name_variant = sys_nm_full.last.to_s.downcase.gsub(/\s/, '_').gsub(/^[\s_]+|[\d\s\._]+$/, '')
                unless sys_name_variant.size == 0
                  it "can be passed a symbol as a system version (agent.#{sys_nm_full.first}?(:#{sys_name_variant}))" do
                    expect(agent.send("#{sys_nm_full.first}?", sys_name_variant.to_sym)).to eq true
                  end
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
              it "accepts a browser_name without version: agent.#{browser_nm}?" do
                expect(agent.send("#{browser_nm}?")).to eq true
              end
              it "expects agent.browser? to be true" do
                expect(agent.browser?).to eq true
              end
              it "expects agent.browser?(#{browser_nm}) to be true" do
                expect(agent.browser?(browser_nm)).to eq true
              end
              (UserAgents::AGENTS_CATEGORIES - [:browser]).each do |name|
                it "agent.#{name}_name correctly returns nil if the subject isn't of the right type" do
                  expect(agent.send("#{name}_name")).to eq nil
                end
              end
              if browser_ver
                it "accepts a browser_name w/ version: agent.#{browser_nm}?(#{browser_ver})" do
                  expect(agent.send("#{browser_nm}?", browser_ver)).to eq true
                end
                it "expects agent.browser?(#{browser_nm}, version: #{browser_ver})" do
                  expect(agent.send("#{browser_nm}", browser_ver)).to eq true
                end
              end
            end
          end
          describe "Using not" do
            if agent.browser_name != UserAgents::USE_FOR_UNKNOWN
              browser_nm = agent.browser_name.to_s.downcase.gsub(/\s/, '_')
              it "returns false for agent.not.#{browser_nm}?" do
                expect(agent.not.send("#{browser_nm}?")).to eq false
              end

              describe 'returns true for not being any other browser' do
                brwsrs = (browsers.dup - [browser_nm.upcase.to_sym]).sample(3)
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
