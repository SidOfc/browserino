require 'spec_helper'

describe 'Browserino::Matcher' do
  matcher = Browserino.config.matchers.sample
  matcher = Browserino.config.matchers.sample until matcher.name

  it 'always responds to missing' do
    matcher.respond_to_missing? :whatever
  end
end
