require './book'
require './classroom'
require './corrector'
require './person'
require './rental'
require './student'
require './teacher'

book1 = Book.new('Harry Potter', 'J.K Rowling')
book2 = Book.new('Lord of The Rings', 'Tolkien')

classroom_a101 = Classroom.new('a101')
classroom_b202 = Classroom.new('b202')

Teacher.new('Mathematics', 38, 'John Mayers')
Teacher.new('English', 26, 'Elsa Hoffman')

student1 = Student.new(16, 'Carl')
student2 = Student.new(15, 'Lisa')

classroom_a101.add_students(student1)
pp classroom_a101.students
pp student1.classroom
classroom_a101.add_students(student2)
pp classroom_a101.students.map(&:name)

classroom_b202.add_students(student1)
classroom_b202.add_students(student2)
pp classroom_b202.students.map(&:name)

Rental.new('2022-03-02', book1, student2)
Rental.new('2022-03-01', book2, student1)

pp book1.rentals.count
pp(book1.rentals.map { |rental| rental.person.name })
pp student1.rentals.count
pp(student1.rentals.map { |rental| rental.book.title })
