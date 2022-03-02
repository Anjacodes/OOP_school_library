require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def add_to_classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# p student1 = Student.new(16, 'Bob', 103, parent_permission: false)
# p student1.play_hooky

# p d105 = Classroom.new("d105")
# # pp d105.add_students(student1)
# # pp d105.students

# student2 = Student.new(18, 'Jane')
# d105.add_students(student2)
# pp student2.classroom
