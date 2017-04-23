require 'spec_helper'

describe 'Browserino::Identity' do
  identity = Browserino.config.identities.sample
  identity = Browserino.config.identities.sample until identity.name

  it 'always responds to missing' do
    identity.respond_to_missing? :whatever
  end
end
