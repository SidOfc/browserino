require 'spec_helper'

describe 'Browserino' do
  browsers = Library.data.fetch(:browsers, [])

  browsers.each do |spec|
    exclude = [:user_agent]
    agent   = Browserino.parse spec[:user_agent]

    describe spec[:user_agent] do
      # Test defined property methods in browsers.yml
      spec.reject { |k| exclude.include? k }.each do |test_method, test_result|
        it "correctly outputs #{test_method} for #{agent.name}" do
          expect(agent.send(test_method)).to eq test_result
        end
      end

      # test magic name methods when possible
      unless spec[:name].to_s.strip.empty?
        name = "#{spec[:name]}?"
        it "expects agent.#{name} to be truthy" do
          expect(agent.send("#{name}")).to be_truthy
        end

        it "expects agent.is? :#{spec[:name]} to be truthy" do
          expect(agent.is?(spec[:name])).to be_truthy
        end

        unless spec[:version].to_s.strip.empty?
          name_ver = spec[:version]
          it "expects agent.#{name} '#{name_ver}' to be truthy" do
            expect(agent.send("#{name}", name_ver.to_s)).to be_truthy
          end

          it "expects agent.is? :#{spec[:name]}, version: #{name_ver} to be truthy" do
            expect(agent.is?(spec[:name], version: name_ver)).to be_truthy
          end
        end
      end

      # test magic platform methods when possible
      unless spec[:platform].to_s.strip.empty?
        platform = "#{spec[:platform]}?"
        it "expects agent.#{platform} to be truthy" do
          expect(agent.send("#{platform}")).to be_truthy
        end

        it "expects agent.is? :#{spec[:platform]} to be truthy" do
          expect(agent.is?(spec[:platform])).to be_truthy
        end

        unless spec[:platform_version].to_s.strip.empty?
          plat_ver = spec[:platform_version]
          it "expects agent.#{platform} '#{plat_ver}' to be truthy" do
            expect(agent.send("#{platform}", plat_ver.to_s)).to be_truthy
          end

          it "expects agent.is? :#{spec[:platform]}, version: #{plat_ver} to be truthy" do
            expect(agent.is?(spec[:platform], version: plat_ver)).to be_truthy
          end
        end
      end

      # test magic engine methods when possible
      unless spec[:engine].to_s.strip.empty?
        engi = "#{spec[:engine]}?"
        it "expects agent.#{engi} to be truthy" do
          expect(agent.send("#{engi}")).to be_truthy
        end

        it "expects agent.is? :#{spec[:engine]} to be truthy" do
          expect(agent.is?(spec[:engine])).to be_truthy
        end

        unless spec[:engine_version].to_s.strip.empty?
          engi_ver = spec[:engine_version]
          it "expects agent.#{engi} '#{engi_ver}' to be truthy" do
            expect(agent.send("#{engi}", engi_ver.to_s)).to be_truthy
          end

          it "expects agent.is? :#{spec[:engine]}, version: #{engi_ver} to be truthy" do
            expect(agent.is?(spec[:engine], version: engi_ver)).to be_truthy
          end
        end
      end
    end
  end
end
