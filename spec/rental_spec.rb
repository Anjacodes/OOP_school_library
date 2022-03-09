require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before :each do
    @book = Book.new('Siddharta', 'Hermann Hesse')
    @person = Person.new(25, 'Alexander')
    @rental = Rental.new('10/30/1945', @book, @person)
  end

  it 'Creates an instance of Rental' do
    expect(@rental).to be_a Rental
  end

  it 'Adds rentals to books' do
    expect(@book.rentals.length).to be 1
  end

  it 'Adds rentals to person' do
    expect(@person.rentals.length).to be 1
  end
end
