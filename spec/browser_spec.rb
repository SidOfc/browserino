require 'spec_helper'

describe 'Browserino' do
  browsers = Library.data.fetch(:browsers, [])

  browsers.each do |spec|
    agent = Browserino.parse spec[:user_agent]

    describe spec[:user_agent] do
      spec.reject { |k| k == :user_agent }.each do |test_method, test_result|
        it "correctly outputs #{test_method} for #{agent.name}" do
          expect(agent.send(test_method)).to eq test_result
        end
      end
    end
  end

  describe 'Browserino::Agent defined names' do
    ua    = browsers.sample[:user_agent]
    agent = Browserino.parse ua

    Browserino.names.each do |name|
      it "defines agent.#{name}?" do
        expect(agent.send("#{name}?")).to eq (agent.name == name)
      end
    end
  end

  describe 'Browserino::Agent defined types' do
    ua    = browsers.sample[:user_agent]
    agent = Browserino.parse ua

    Browserino.types.each do |type|
      it "defines agent.#{type}?" do
        expect(agent.send("#{type}?")).to eq (agent.type == type)
      end
    end
  end
end
