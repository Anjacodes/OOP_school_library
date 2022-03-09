require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('555')
    @student = Student.new(25, 'Iris')
  end
  it 'Creates a instance of Classroom' do
    expect(@classroom).to be_a Classroom
  end
  it 'Creates a classroom label' do
    expect(@classroom.label).to eq '555'
  end
  it 'Adds a student to the classrom' do
    @classroom.add_students(@student)
    expect(@classroom.students.length).to be 1
  end
end
