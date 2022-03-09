require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(25, 'Johnny')
  end

  it 'creates instance of Person' do
    expect(@person).to be_a(Person)
  end

  it 'returns arguments with getter' do
    expect(@person.age).to eq 25
    expect(@person.name).to eq 'Johnny'
  end

  it 'checks if person can use services' do
    expect(@person.can_use_services?).to be true
  end
end
