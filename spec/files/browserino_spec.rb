require 'spec_helper'

puts Library.data

describe Browserino do
  Library.data.fetch('browsers', []).each do |spec|
    it "can identify #{spec['name']}" do
      agent = Browserino.parse spec['user_agent']
      expect(agent.name).to eq spec['name']
    end
  end
end
