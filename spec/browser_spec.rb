require 'spec_helper'

describe 'Browserino' do
  browsers = Library.data.fetch(:browsers, [])

  browsers.each do |spec|
    exclude = [:user_agent]
    agent   = Browserino.parse spec[:user_agent]

    describe spec[:user_agent] do
      spec.reject { |k| exclude.include? k }.each do |test_method, test_result|
        it "correctly outputs #{test_method} for #{agent.name}" do
          expect(agent.send(test_method)).to eq test_result
        end
      end
    end
  end
end
