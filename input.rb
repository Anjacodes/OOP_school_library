require 'json'

class Input
  def initialize(path)
    @path = path
  end

  def read_books(state)
    books_json = File.read("#{@path}/books.json")
    books_hash = JSON.parse(books_json)
    books = books_hash.map { |book| Book.new(book['title'], book['author']) }
    state[:book_list].concat(books)
  end

  def read_people(state)
    people_json = File.read("#{@path}/people.json")
    people_hash = JSON.parse(people_json)
    students = people_hash["students"].map { |student| Student.new(student["age"], student["name"], parent_permission: student["parent_permission"])}
    teachers = people_hash["teachers"].map { |teacher| Teacher.new(teacher["age"], teacher["name"], teacher["specialization"])}
    state[:people_list].concat(students).concat(teachers)
  end
end