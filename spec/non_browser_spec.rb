require 'spec_helper'

TYPE_MAP = { validators: :validator, bots: :bot, libraries: :library }
(Library.data.keys - [:browsers]).each do |type|
  describe "Browserino #{type}" do
    Library.data.fetch(type, []).each do |spec|
      ua          = spec.delete :user_agent
      client      = Browserino.parse ua
      spec[:type] ||= TYPE_MAP[type]

      describe [client.name, ua].join(' :: ') do
        if spec[:to_s]
          it "expects client.to_s to be '#{spec[:to_s]}'" do
            expect(client.to_s).to eq spec[:to_s]
          end
        end

        spec.reject { |k, _| k == :to_s }.each do |test_method, test_result|
          additional = test_result && " and client.#{test_method}?('#{test_result}') to be #{test_result && 'truthy' || 'falsy'}"
          it "expects client.#{test_method} to be '#{test_result}'#{additional}" do
            expect(client.send(test_method)).to eq test_result
            if test_result
              expect(client.send("#{test_method}?", test_result)).to be_truthy
            else
              expect(client.send("#{test_method}?", test_result)).to be_falsy
            end
          end
        end

        # test magic aliasses when defined
        Browserino.config.aliasses[spec[:name]].each do |alt|
          it "expects client.#{alt}? to be truthy" do
            expect(client.send("#{alt}?")).to be_truthy
          end

          if spec[:version]
            it "expects client.#{alt}?('#{spec[:version]}') to be truthy}" do
              expect(client.send("#{alt}?", spec[:version])).to be_truthy
            end
          end
        end

        # test magic name methods when possible
        unless spec[:name].to_s.strip.empty?
          name = "#{spec[:name]}?"
          it "expects client.#{name} and client.is?('#{spec[:name]}') to be truthy" do
            expect(client.send("#{name}")).to be_truthy
            expect(client.is?(spec[:name])).to be_truthy
          end

          unless spec[:version].to_s.strip.empty?
            name_ver = spec[:version]
            it "expects client.#{name}('#{name_ver}') and client.is?('#{spec[:name]}', version: '#{name_ver}') to be truthy" do
              expect(client.send("#{name}", name_ver.to_s)).to be_truthy
              expect(client.is?(spec[:name], version: name_ver)).to be_truthy
            end
          end
        end
      end
    end
  end
end
