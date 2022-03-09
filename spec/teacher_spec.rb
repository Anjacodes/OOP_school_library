require_relative '../teacher'
require_relative '../person'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Biology', 30, 'Diane')
  end

  it 'create an instance of Teacher' do
    expect(@teacher).to be_a Teacher
  end

  it 'create an instance of Person' do
    expect(@teacher).to be_a Person
  end

  it 'allows teacher to use services' do
    expect(@teacher.can_use_services?).to be true
  end
end
