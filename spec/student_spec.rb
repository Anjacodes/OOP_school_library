require_relative '../student'
require_relative '../person'

describe Student do
  before :each do
    @student = Student.new(13, 'Harry')
  end

  it 'creates an instance of Student' do
    expect(@student).to be_a Student
  end

  it 'creates an instance of Person' do
    expect(@student).to be_a Person
  end

  it 'allows student to play hooky' do
    expect(@student.play_hooky).to eq "¯\(ツ)/¯"
  end
end
