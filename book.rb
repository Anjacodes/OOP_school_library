class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

# book_1 = Book.new("Harry Potter", "J.K Rowling")
# pp book_1
