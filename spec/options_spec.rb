require 'spec_helper'

describe 'Browserino::Options' do
  options = Browserino::Options.new settings: true, something: false, foo: :bar

  it 'always responds to missing' do
    expect(options.respond_to?(:settings)).to be true
  end

  it 'can be merged with a hash' do
    expect(options.merge({settings: false}).settings).to be false
  end

  it 'can be converted to a hash' do
    expect(options.to_h).to be_a Hash
    expect(options.to_hash).to be_a Hash
  end

  it 'can be converted to an array' do
    expect(options.to_a).to be_a Array
  end

  it 'can be converted to a string' do
    expect(options.to_s).to be_a String
    expect(options.to_str).to be_a String
  end
end
