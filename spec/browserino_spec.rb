require 'spec_helper'

describe Browserino do
  it 'has a version number' do
    expect(Browserino::VERSION).not_to be nil
  end

  it 'contains hash keys to determine every major browser' do
    @major_browsers = [:opera, :ie, :firefox, :chrome, :safari]
    expect((Browserino::PATTERNS[:browser].keys & @major_browsers).empty?).to eq(false)
  end
end
