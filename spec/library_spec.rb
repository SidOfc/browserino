require 'spec_helper'

describe Browserino do
  Library.data.fetch(:libraries, []).each do |spec|
    ua          = spec.delete :user_agent
    client      = Browserino.parse ua
    spec[:type] ||= :library

    describe ua do
      spec.each do |test_method, test_result|
        it "expects #{test_method} to be #{test_result}" do
          expect(client.send(test_method)).to eq test_result
        end

        it "expects client.#{test_method}? #{test_result && ":#{test_result}"} to be #{test_result.nil? && 'falsy' || 'truthy'}" do
          if test_result.nil?
            expect(client.send("#{test_method}?", test_result)).to eq client.send test_method
          else
            expect(client.send("#{test_method}?", test_result)).to be_truthy
          end
        end
      end

      # test magic aliasses when defined
      Browserino.aliasses[spec[:name]].each do |alt|
        it "expects client.#{alt}? to be truthy" do
          expect(client.send("#{alt}?")).to be_truthy
        end

        it "expects client.#{alt}? #{spec[:version]} to be #{spec[:version] && 'truthy' || 'falsy'}" do
          if spec[:version].nil?
            expect(client.send("#{alt}?", spec[:version])).to eq spec[:name]
          else
            expect(client.send("#{alt}?", spec[:version])).to be_truthy
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
    end
  end
end
