require 'spec_helper'

describe 'Browserino::Matcher' do
  matcher = Browserino.config.matchers.sample
  matcher = Browserino.config.matchers.sample until matcher.name

  it 'aliasses #matches? to #=~' do
    expect(matcher =~ matcher.name.to_s).to be_truthy
  end

  it 'can be converted to a string' do
    expect(matcher.to_s).to be_a String
  end

  it 'can be compared to a regexp' do
    expect(matcher == /#{matcher.name}/i).to be_truthy
  end

  it 'can be compared to a string' do
    expect(matcher == matcher.name.to_s).to be_truthy
  end

  it 'can be compared to a matcher' do
    m2 = matcher.dup
    expect(matcher == m2).to be_truthy
  end
end
