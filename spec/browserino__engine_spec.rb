describe 'Browserino::Engine' do
  it 'has a name' do
    expect(Browserino::Engine).to respond_to :name
  end

  it 'has a version' do
    expect(Browserino::Engine).to respond_to :version
  end
end
