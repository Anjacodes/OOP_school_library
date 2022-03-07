class Create_Book
  def initialize(state)
    @state = state
    @book_list = @state[:book_list]
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book_list << Book.new(title, author)
    p 'Book created successfully'
    puts ''
  end
end