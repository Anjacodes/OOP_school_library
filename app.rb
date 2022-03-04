require './book'
require './person'
require './rental'
require './student'
require './teacher'

class App
  attr_accessor :book_list
  attr_reader :user_options

  def initialize
    @user_options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
                     'List all rentals for a given person id', 'Exit']
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def run
    p 'Please choose an option by entering a number:'
    @user_options.each_with_index do |option, index|
      p "#{index + 1} - #{option}"
    end
    user_choice = gets.chomp
    execute(user_choice)
  end

  def execute(user_choice) # rubocop:disable Metrics/CyclomaticComplexity
    case user_choice.to_i
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then rentals_for_id
    when 7 then exit_app
    else p 'Please enter a number between 1 and 7'
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

  def list_people
    if @people_list.empty?
      p 'There are no people in the list, please create a person7 choosing option 3'
    else
      @people_list.each do |person|
        p "[#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
    puts ''
    run
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    user_choice = gets.chomp
    case user_choice.to_i
    when 1 then create_student
    when 2 then create_teacher
    else p 'Please enter either 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission_input = gets.chomp.downcase
    permission = permission_input == 'y'
    people_list << Student.new(age, name, parent_permission: permission)
    p 'Student created successfully'
    puts ''
    run
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people_list << Teacher.new(specialization, age, name)
    p 'Teacher created successfully'
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
    p 'Thank you for using this app!'
  end
end
