require 'spec_helper'
require 'user_agents'
require 'user_agents_library'

describe "Browserino Library identification" do
  libraries = UserAgents::Library.constants(true)
  libraries.each do |library|
    UserAgents::Library.const_get(library).each do |ua, criteria|
      describe "#{library} - #{ua}" do
        agent = Browserino.parse ua
        lib_name = library.downcase
        it "Expects agent.#{lib_name}? to be true for #{lib_name}" do
          expect(agent.send("#{lib_name}?")).to eq true
        end
        if (lib_version = agent.library_version)
          it "Expects agent.#{lib_name}?(#{lib_version}) to be true for #{lib_name}" do
            expect(agent.send("#{lib_name}?", lib_version)).to eq true
          end
        end
        criteria.each do |prop, val|
          if prop == :library?
            it "Expects agent.library? to be true for #{lib_name}" do
              expect(agent.library?).to eq true
            end
            it "Expects agent.library?(#{lib_name}) to be true for #{lib_name}" do
              expect(agent.library?(lib_name)).to eq true
            end
            if lib_version
              it "Expects agent.library?(#{lib_name}, version: #{lib_version}) to be true for #{lib_name}" do
                expect(agent.library?(lib_name, version: lib_version)).to eq true
              end
            end
          else
            it "Expects agent.#{prop} to be #{val} for #{lib_name}" do
              expect(agent.send(prop).downcase).to eq val.downcase
            end
          end
        end
      end
    end
  end
end
