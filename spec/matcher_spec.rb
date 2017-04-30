require 'spec_helper'

describe 'Browserino::Matcher' do
  matcher = Browserino.config.matchers.sample
  matcher = Browserino.config.matchers.sample until matcher.name

  it 'always responds to missing' do
    expect(matcher.respond_to?(:something)).to be true
  end

  it 'aliasses #matches? to #=~' do
    expect(matcher =~ matcher.name.to_s).to be_truthy
  end

  it 'can be converted to a string' do
    expect(matcher.to_s).to be_a String
    expect(matcher.to_str).to be_a String
  end

  it 'can be compared to a regexp' do
    expect(matcher == /#{matcher.name}/i).to be_truthy
  end

  it 'can not be compared to a number' do
    expect(matcher == 100).to be_falsy
  end

  it 'can be compared to a string' do
    expect(matcher == matcher.name.to_s).to be_truthy
  end

  it 'can be compared to a matcher' do
    m2 = matcher.dup
    expect(matcher == m2).to be_truthy
  end
end
