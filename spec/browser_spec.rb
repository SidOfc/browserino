require 'spec_helper'

describe 'Browserino browsers' do
  browsers = Library.data.fetch(:browsers, [])

  browsers.each do |spec|
    exclude = [:user_agent, :mobile, :to_s]
    client  = Browserino.parse spec[:user_agent]

    describe [client.name, spec[:user_agent]].join(' :: ') do
      if client.type != :unknown
        it "expects client.type?(:browser) to be true" do
          expect(client.type?(:browser)).to eq true
        end
      end

      if [:x64, :arm, :x32].include?(client.architecture)
        it "expects client.#{client.architecture}? to be true" do
          expect(client.send("#{client.architecture}?")).to eq true
        end
      end

      if spec[:to_s]
        it "expects client.to_s to be '#{spec[:to_s]}'" do
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
        it "expects client.#{test_method} to be '#{test_result}' and client.#{test_method}?('#{test_result}') to be #{test_result && 'truthy' || 'falsy'}" do
          expect(client.send(test_method)).to eq test_result
          if test_result
            expect(client.send("#{test_method}?", test_result)).to be_truthy
          else
            expect(client.send("#{test_method}?", test_result)).to be_falsy
          end
        end
      end

      [:name, :engine, :platform].each do |prop|
        result  = spec[prop]
        name    = "#{spec[prop]}?"
        ver     = spec[Library::Helpers.version_sym_for(prop)]
        has_ver = ver.to_s.strip.empty?

        unless result.to_s.strip.empty?
          additional = has_ver && ", client.#{name}('#{ver}') and client.is?('#{spec[:name]}', version: #{ver})"
          it "expects client.#{name}, client.is?('#{spec[prop]}')#{additional} to be truthy" do
            expect(client.send("#{name}")).to be_truthy
            expect(client.is?(spec[prop])).to be_truthy

            if has_ver
              expect(client.send("#{name}", ver.to_s)).to be_truthy
              expect(client.is?(spec[prop], version: ver)).to be_truthy
            end
          end
        end

        # test magic aliasses when defined
        next unless Browserino.config.aliasses[result].any?

        Browserino.config.aliasses[result].each do |alt|
          it "expects client.#{alt}?#{ver && "and client.#{alt}?('#{ver}')"} to be truthy" do
            expect(client.send("#{alt}?")).to be_truthy
            expect(client.send("#{alt}?", ver)).to be_truthy if has_ver
          end
        end
      end
    end
  end
end
