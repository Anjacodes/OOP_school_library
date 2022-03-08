require './corrector'
require './rental'
require 'securerandom'

class Person
  attr_accessor :name, :age, :parent_permission, :id
  attr_reader :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @name_corrector = Corrector.new
    @rentals = []
    @id = SecureRandom.uuid.slice(0..3)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    return true unless @age < 18 || @parent_permission == false

    false
  end

  def validate_name(_name)
    @name = @name_corrector.correct_name(@name)
  end

  private

  def of_age?
    return true unless @age < 18

    false
  end
end

# p person1 = Person.new(19, 'Harry')
# p person1.can_use_services?
# p person1.send(:of_age?)

# p person2 = Person.new(17, 'Janet')
# p person2.can_use_services?
# p person2.send(:of_age?)

# person3 = Person.new(21, 'schifffahrtsgesellschaft')
# pp person3.validate_name(person3.name)
