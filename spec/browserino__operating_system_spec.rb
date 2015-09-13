describe 'Browserino::OperatingSystem' do
  it 'has a name' do
    expect(Browserino::OperatingSystem).to respond_to :name
  end

  it 'has a version' do
    expect(Browserino::OperatingSystem).to respond_to :version
  end

  it 'has an architecture' do
    expect(Browserino::OperatingSystem).to respond_to :architecture
  end
end
