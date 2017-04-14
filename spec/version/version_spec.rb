require 'spec_helper'

vrsn_alias = Browserino::Agent::Version

describe 'Browserino::Agent::Version' do
  it 'maps numeric arguments to a version' do
    a = vrsn_alias.new 10, 0, 1
    b = vrsn_alias.new 9,  9, 9

    expect(a.major).to eq 10
    expect(a.minor).to eq 0
    expect(a.patch).to eq 1

    expect(a == b).to eq false
    expect(a != b).to eq true

    expect(a <= b).to eq false
    expect(a < b).to  eq false

    expect(a >= b).to eq true
    expect(a > b).to  eq true
  end

  it 'correctly identifies less and / or equal than' do
    a = vrsn_alias.new '4.2.0'
    b = vrsn_alias.new '4.2.0'

    c = vrsn_alias.new '1.33.7'
    d = vrsn_alias.new '1.33.9'

    expect(a < b).to  eq false
    expect(a <= b).to eq true

    expect(c < d).to  eq true
    expect(c <= d).to eq true

    expect(d < c).to  eq false
    expect(d <= c).to eq false
  end

  it 'correctly identifies greater and / or equal than' do
    a = vrsn_alias.new '4.2.0'
    b = vrsn_alias.new '4.2.0'

    c = vrsn_alias.new '1.33.7'
    d = vrsn_alias.new '1.33.9'

    expect(a > b).to  eq false
    expect(a >= b).to eq true

    expect(c > d).to  eq false
    expect(c >= d).to eq false

    expect(d > c).to  eq true
    expect(d >= c).to eq true
  end

  it 'correctly handles equality and inequality' do
    a = vrsn_alias.new '4.2.0'
    b = vrsn_alias.new '4.2.0'

    c = vrsn_alias.new '1.33.7'
    d = vrsn_alias.new '1.33.9'

    expect(a == b).to eq true
    expect(a != b).to eq false

    expect(c == d).to eq false
    expect(c != d).to eq true
  end
end
