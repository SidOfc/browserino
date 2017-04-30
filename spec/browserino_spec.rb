require 'spec_helper'

describe 'Browserino' do
  it 'can parse regex flags' do
    num  = Browserino.get_flags :m, :i, :x
    num2 = Browserino.get_flags :m, :i
    num3 = Browserino.get_flags :i

    expect(num  == 7).to be_truthy
    expect(num2 == 5).to be_truthy
    expect(num3 == 1).to be_truthy
  end
end
