require './person'

class Student < Person
  def initialize(classroom, *args, **kwargs)
    super(*args, **kwargs)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

p student1 = Student.new(16, 'Bob', 103, parent_permission: false)
p student1.play_hooky
