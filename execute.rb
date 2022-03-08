require './list_people'
require './app'
require './create_person'
require './list_books'
require './create_book'
require './create_rental'
require './list_rentals'
require './exit'

class Execute
  def initialize(state)
    @state = state
    @people = ListPeople.new(@state)
    @person = CreatePerson.new(@state)
    @list_books = ListBooks.new(@state)
    @create_book = CreateBook.new(@state)
    @create_rental = CreateRental.new(@state)
    @list_rentals = ListRentals.new(@state)
    @exit = Exit.new(@state)
  end

  def execute(user_choice) # rubocop:disable Metrics/CyclomaticComplexity
    case user_choice.to_i
    when 1 then @list_books.list_books
    when 2 then @people.list_people
    when 3 then @person.create_person
    when 4 then @create_book.create_book
    when 5 then @create_rental.create_rental
    when 6 then @list_rentals.rentals_for_id
    when 7 then @exit.exit_app
    else p 'Please enter a number between 1 and 7'
    end
  end
end
