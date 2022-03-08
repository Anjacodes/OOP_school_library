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
end