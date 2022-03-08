require 'fileutils'
require 'json'
require './student'

class Output
  def initialize(path)
    @path = path
  end

  def create_files
    Dir.mkdir(@path) unless Dir.exist?(@path)
    FileUtils.touch("#{@path}/books.json") unless File.exist?("#{@path}/books.json")
    FileUtils.touch("#{@path}/people.json") unless File.exist?("#{@path}/people.json")
    FileUtils.touch("#{@path}/rentals.json") unless File.exist?("#{@path}/rentals.json")
  end

  def save_books(state)
    books_hash = state[:book_list].map {|book| {title: book.title, author: book.author}}
    books_json = JSON.generate(books_hash)
    File.open("#{@path}/books.json", 'w') { |f| f.write books_json }
  end

  def save_people(state)
    students = state[:people_list].filter { |student| student.instance_of? Student }
    teachers = state[:people_list].filter { |teacher| teacher.instance_of? Teacher }
    students_hash = students.map { |student| {name: student.name, age: student.age, permission: student.parent_permission } }
    teacher_hash = teachers.map { |teacher| {name: teacher.name, age: teacher.age, specialization: teacher.specialization } }
    people_json = JSON.generate({students: students_hash, teachers: teacher_hash})
    File.open("#{@path}/people.json", 'w') { |f| f.write people_json}
  end
end