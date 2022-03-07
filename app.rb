require './book'
require './person'
require './rental'
require './student'
require './teacher'
require './execute'

class App
  attr_accessor :book_list, :people_list
  attr_reader :user_options

  def initialize
    @user_options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
                     'List all rentals for a given person id', 'Exit']
    @state = {book_list: [], people_list: [], rental_list: [], keep_going: true}
  end

  def run
    while @state[:keep_going]
      p 'Please choose an option by entering a number:'
      @user_options.each_with_index do |option, index|
        p "#{index + 1} - #{option}"
      end
      user_choice = gets.chomp
      @exec = Execute.new(@state)
      @exec.execute(user_choice)
    end
  end

  def list_books
    if @book_list.empty?
      p 'There are no books in the list, please create a book choosing option 4'
    else
      @book_list.each { |book| p "Title: '#{book.title}', Author: #{book.author}" }
    end
    puts ''
    run
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @book_list << Book.new(title, author)
    p 'Book created successfully'
    puts ''
    run
  end

  def create_rental
    p 'Select a book from the following list by number'
    @book_list.each_with_index do |book, index|
      p "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book = @book_list[gets.chomp.to_i]
    p 'Select a person from the following list by number (not id)'
    @people_list.each_with_index do |person, index|
      p "#{index}) [#{person.class.name}] Name: '#{person.name}', ID: #{person.id}, Age: #{person.age}"
    end
    person = @people_list[gets.chomp.to_i]
    print 'Date: '
    date = gets.chomp
    @rental_list << Rental.new(date, book, person)
    p 'Rental created successfully'
    puts ''
    run
  end

  def rentals_for_id
    if @people_list.empty?
      p 'There is no one to choose from'
    else
      print 'ID of person: '
      id = gets.chomp
      @people_list.each do |person|
        next unless person.id == id

        person.rentals.each do |rental|
          p "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
    puts ''
    run
  end

  def exit_app
    @state[:keep_going] = false 
    p 'Thank you for using this app!'
  end
end
