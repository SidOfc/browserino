require 'spec_helper'

p Library.data

describe Browserino do
  Library.data.fetch(:browsers, []).each do |spec|
    agent = Browserino.parse spec.delete(:user_agent)

    describe agent.name do
      spec.each do |test_method, expected_result|
        it "correctly outputs #{test_method}" do
          expect(agent.send(test_method)).to eq expected_result
        end
      end
    end
  end
end
