describe 'Browserino::Browser' do
  it 'has a name' do
    expect(Browserino::Browser).to respond_to :name
  end

  it 'has a version' do
    expect(Browserino::Browser).to respond_to :version
  end
end
