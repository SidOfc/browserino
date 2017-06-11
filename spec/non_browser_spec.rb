# frozen_string_literal: true

require 'spec_helper'

TYPE_MAP = { validators: :validator, bots: :bot, libraries: :library,
             emails: :email, rss: :rss }.freeze

TYPE_MAP.each do |type, singular_type|
  describe "Browserino #{type}" do
    Library.data.fetch(type, []).shuffle.each do |spec|
      ua          = spec.delete :user_agent
      client      = Browserino.parse ua
      spec[:type] ||= singular_type

      describe [client.name, ua].join(' :: ') do
        if spec[:to_s]
          it "expects client.to_s to be '#{spec[:to_s]}'" do
            expect(client.to_s).to eq spec[:to_s]
          end
        end

        spec.reject { |k, _| k == :to_s }.each do |test_method, test_result|
          it "expects client.#{test_method} to be '#{test_result}'" do
            expect(client.send(test_method)).to eq test_result
          end
        end

        # test magic aliasses when defined
        Browserino.config.aliasses[spec[:name]].each do |alt|
          additional = !spec[:version].to_s.strip.empty? && " and client.#{alt}?('#{spec[:version]}')" || ''
          it "expects client.#{alt}?#{additional} to be truthy" do
            expect(client.send("#{alt}?")).to be_truthy
            expect(client.send("#{alt}?", spec[:version])).to be_truthy unless spec[:version].to_s.strip.empty?
          end
        end

        # test magic name methods when possible
        unless spec[:name].to_s.strip.empty?
          name       = "#{spec[:name]}?"
          ver        = spec[:version]
          has_ver    = !ver.to_s.strip.empty?
          additional = has_ver && ", client.#{name}('#{ver}') and client.is?('#{spec[:name]}', version: '#{ver}')" || ''
          it "expects client.#{name}#{has_ver && ', ' || ' and '} client.is?('#{spec[:name]}')#{additional} to be truthy" do
            expect(client.send("#{name}")).to be_truthy
            expect(client.is?(spec[:name])).to be_truthy

            if has_ver
              expect(client.send("#{name}", ver.to_s)).to be_truthy
              expect(client.is?(spec[:name], version: ver)).to be_truthy
            end
          end

          additional = has_ver && ", client.not.#{name}('#{ver}') and client.not.is?('#{spec[:name]}', version: '#{ver}')" || ''
          it "expects client.not.#{name}#{has_ver && ', ' || ' and '} client.not.is?('#{spec[:name]}')#{additional} to be falsy" do
            expect(client.not?(spec[:name])).to be_falsy
            expect(client.not?(spec[:name], version: ver)).to be_falsy if has_ver

            expect(client.not.is?(spec[:name])).to be_falsy
            expect(client.not.is?(spec[:name], version: ver)).to be_falsy if has_ver
          end
        end
      end
    end
  end
end
