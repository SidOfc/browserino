require 'spec_helper'

describe Browserino do
  it 'has a version number' do
    expect(Browserino::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end
end

describe Browserino::Greeter do

  it 'greets someone' do
    @greeter = Browserino::Greeter.new
    expect(@greeter.greet).to eq('Hello, guest.')
  end

  it 'greets someone by name' do
    @greeter = Browserino::Greeter.new
    expect(@greeter.greet('Henk')).to eq('Hello, Henk.')
  end
end
