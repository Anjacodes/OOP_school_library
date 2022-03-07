require './list_people'
require './app'

class Execute
  def initialize(state)
    @person = App.new
    @state = state
    @people = List_People.new(@state)
  end
  def execute(user_choice) # rubocop:disable Metrics/CyclomaticComplexity
    case user_choice.to_i
    when 1 then list_books
    when 2 then @people.list_people
    when 3 then @person.create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then rentals_for_id
    when 7 then exit_app
    else p 'Please enter a number between 1 and 7'
    end
  end
end