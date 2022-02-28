require './person'

class Student < Person
  def initialize(age, name, classroom, parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

p student1 = Student.new(16, 'Seth',  103)