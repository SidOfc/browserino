require 'spec_helper'

describe 'Browserino' do
  browsers = Library.data.fetch(:browsers, [])

  browsers.each do |spec|
    exclude     = [:user_agent]
    client      = Browserino.parse spec[:user_agent]
    spec[:type] ||= :browser

    describe [client.name, spec[:user_agent]].join(' :: ') do
      # Test defined property methods in browsers.yml
      spec.reject { |k| exclude.include? k }.each do |test_method, test_result|
        it "expects client.#{test_method} to be #{test_result || 'nil'}" do
          expect(client.send(test_method)).to eq test_result
        end

        it "expects client.#{test_method}? #{test_result && ":#{test_result}"} to be #{test_result && 'truthy' || 'falsy'}" do
          if test_result.nil?
            expect(client.send("#{test_method}?", test_result)).to eq client.send test_method
          else
            expect(client.send("#{test_method}?", test_result)).to be_truthy
          end
        end
      end

      # test magic aliasses when defined
      [:name, :engine, :platform].each do |prop|
        result  = spec[prop]

        ver_res = spec[:version] if prop == :name
        ver_res = spec["#{prop}_version".to_sym] if ver_res.nil?

        Browserino.aliasses[result].each do |alt|
          it "expects client.#{alt}? to be truthy" do
            expect(client.send("#{alt}?")).to be_truthy
          end

          it "expects client.#{alt}? #{ver_res} to be #{ver_res && 'truthy' || 'falsy'}" do
            if ver_res.nil?
              expect(client.send("#{alt}?", ver_res)).to eq client.send prop
            else
              expect(client.send("#{alt}?", ver_res)).to be_truthy
            end
          end
        end
      end

      # test magic name methods when possible
      unless spec[:name].to_s.strip.empty?
        name = "#{spec[:name]}?"
        it "expects client.#{name} to be truthy" do
          expect(client.send("#{name}")).to be_truthy
        end

        it "expects client.is? :#{spec[:name]} to be truthy" do
          expect(client.is?(spec[:name])).to be_truthy
        end

        unless spec[:version].to_s.strip.empty?
          name_ver = spec[:version]
          it "expects client.#{name} '#{name_ver}' to be truthy" do
            expect(client.send("#{name}", name_ver.to_s)).to be_truthy
          end

          it "expects client.is? :#{spec[:name]}, version: #{name_ver} to be truthy" do
            expect(client.is?(spec[:name], version: name_ver)).to be_truthy
          end
        end
      end

      # test magic platform methods when possible
      unless spec[:platform].to_s.strip.empty?
        platform = "#{spec[:platform]}?"
        it "expects client.#{platform} to be truthy" do
          expect(client.send("#{platform}")).to be_truthy
        end

        it "expects client.is? :#{spec[:platform]} to be truthy" do
          expect(client.is?(spec[:platform])).to be_truthy
        end

        unless spec[:platform_version].to_s.strip.empty?
          plat_ver = spec[:platform_version]
          it "expects client.#{platform} '#{plat_ver}' to be truthy" do
            expect(client.send("#{platform}", plat_ver.to_s)).to be_truthy
          end

          it "expects client.is? :#{spec[:platform]}, version: #{plat_ver} to be truthy" do
            expect(client.is?(spec[:platform], version: plat_ver)).to be_truthy
          end
        end
      end

      # test magic engine methods when possible
      unless spec[:engine].to_s.strip.empty?
        engi = "#{spec[:engine]}?"
        it "expects client.#{engi} to be truthy" do
          expect(client.send("#{engi}")).to be_truthy
        end

        it "expects client.is? :#{spec[:engine]} to be truthy" do
          expect(client.is?(spec[:engine])).to be_truthy
        end

        unless spec[:engine_version].to_s.strip.empty?
          engi_ver = spec[:engine_version]
          it "expects client.#{engi} '#{engi_ver}' to be truthy" do
            expect(client.send("#{engi}", engi_ver.to_s)).to be_truthy
          end

          it "expects client.is? :#{spec[:engine]}, version: #{engi_ver} to be truthy" do
            expect(client.is?(spec[:engine], version: engi_ver)).to be_truthy
          end
        end
      end
    end
  end
end
