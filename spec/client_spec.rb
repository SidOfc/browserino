require 'spec_helper'

describe 'Browserino::Client' do
  client = Browserino.parse Library.random_user_agent
  client = Browserino.parse Library.random_user_agent until client.name

  it 'always responds to missing' do
    expect(client.respond_to?(client.name)).to be true
  end

  it 'can be compared to a regexp' do
    name_pat = /.*?#{client.name}.*?/i

    expect(name_pat =~ client).to be_truthy
    expect(name_pat !~ client).to be_falsy
    expect(client =~ name_pat).to be_truthy
    expect(client == name_pat).to be_truthy
    expect(client !~ name_pat).to be_falsy
    expect(client != name_pat).to be_falsy
  end

  it 'can be compared to a symbol' do
    expect(client == client.name).to be_truthy
    expect(client != client.name).to be_falsy
  end

  it 'cannot be compared to a number' do
    expect(client == 10).to be_falsy
  end

  it 'can be compared to a string' do
    expect(client == client.name.to_s).to be_truthy
    expect(client != client.name.to_s).to be_falsy
  end

  it 'can be converted to a hash' do
    expect(client.to_h).to be_a Hash
    expect(client.to_hash).to be_a Hash
  end

  it 'can be converted to an array' do
    expect(client.to_a).to be_a Array
  end

  it 'can be converted to a string' do
    expect(client.to_s).to be_a String
    expect(client.to_str).to be_a String
  end

  it 'can be converted to json' do
    json = client.to_json
    expect(JSON.parse(json)).to be_a Hash
  end

  it 'always responds to missing' do
    client.respond_to_missing? :whatever
  end
end
