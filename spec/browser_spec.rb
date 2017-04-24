require 'spec_helper'

describe 'Browserino browsers' do
  browsers = Library.data.fetch(:browsers, [])

  browsers.each do |spec|
    exclude = [:user_agent, :mobile, :to_s]
    client  = Browserino.parse spec[:user_agent]

    describe [client.name, spec[:user_agent]].join(' :: ') do
      if client.type != :unknown
        it "expects client.type? :browser to be true" do
          expect(client.type?(:browser)).to eq true
        end
      end

      if client.architecture == :x64
        it "expects client.x64? to be true" do
          expect(client.x64?).to eq true
        end
      elsif client.architecture == :x32
        it "expects client.x32? to be true" do
          expect(client.x32?).to eq true
        end
      elsif client.architecture == :arm
        it "expects client.arm? to be true" do
          expect(client.arm?).to eq true
        end
      end

      if spec[:to_s]
        it "expects client.to_s to be #{spec[:to_s]}" do
          expect(client.to_s).to eq spec[:to_s]
        end
      end

      # test defined property name presence
      it 'expects all properties in client.properties to be defined with formatted values' do
        client.properties.each do |property, value|
          expect { spec.keys.include? property }
          expect(value).to eq client.send property
        end
      end

      # test mobile properties
      it "expects client.mobile? to be #{client.mobile? && 'true' || 'false'}" do
        expect(client.mobile?).to eq spec[:mobile]
      end

      # Test defined property methods in browsers.yml
      spec.reject { |k| exclude.include? k }.each do |test_method, test_result|
        it "expects client.#{test_method} == '#{test_result}' to be truthy" do
          expect(client.send(test_method) == test_result).to be_truthy
        end

        it "expects client.#{test_method}? '#{test_result}' to be #{test_result && 'truthy' || 'falsy'}" do
          if test_result
            expect(client.send("#{test_method}?", test_result)).to be_truthy
          else
            expect(client.send("#{test_method}?", test_result)).to be_falsy
          end
        end
      end

      # test magic aliasses when defined
      [:name, :engine, :platform].each do |prop|
        result  = spec[prop]

        next unless Browserino.config.aliasses[result].any?

        ver_res = spec[:version] if prop == :name
        ver_res = spec["#{prop}_version".to_sym] if ver_res.nil?

        Browserino.config.aliasses[result].each do |alt|
          it "expects client.#{alt}? to be truthy" do
            expect(client.send("#{alt}?")).to be_truthy
          end

          if ver_res
            it "expects client.#{alt}? '#{ver_res}' to be truthy" do
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

          it "expects client.is? :#{spec[:name]}, version: '#{name_ver}' to be truthy" do
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
