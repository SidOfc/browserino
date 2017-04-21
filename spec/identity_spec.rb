require 'spec_helper'

describe 'Browserino::Identity' do
  identity = Browserino.config.identities.sample
  identity = Browserino.config.identities.sample until identity.name

  it 'can be compared to a regexp' do
    name_pat = /.*?#{identity.name}.*?/i

    expect(name_pat =~ identity).to be_truthy
    expect(name_pat !~ identity).to be_falsy
    expect(identity =~ name_pat).to be_truthy
    expect(identity == name_pat).to be_truthy
    expect(identity !~ name_pat).to be_falsy
    expect(identity != name_pat).to be_falsy
  end

  it 'always responds to missing' do
    identity.respond_to_missing? :whatever
  end
end
