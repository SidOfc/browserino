require 'spec_helper'

describe Browserino do
  Library.data.fetch(:bots, []).each do |spec|
    ua = spec.delete :user_agent
    agent = Browserino.parse ua

    describe ua do
      spec.each do |test_method, expected_result|
        it "correctly outputs #{test_method} for #{agent.name}" do
          expect(agent.send(test_method)).to eq expected_result
        end
      end
    end
  end
end
