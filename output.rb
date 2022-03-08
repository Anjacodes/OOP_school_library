require 'fileutils'
require 'json'

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
end