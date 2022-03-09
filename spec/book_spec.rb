require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
  before :each do
    @book = Book.new("Siddharta", "Hermann Hesse")
    @person = Person.new(25, "Alexander")
  end

  it "creates a new instance of Book" do
    expect(@book).to be_a(Book)
  end

  it "returns arguments with getter" do
    expect(@book.title).to eq "Siddharta"
    expect(@book.author).to eq "Hermann Hesse"
  end

  it "adds a rental to rentals array" do
    @book.add_rental("2022-03-09", @person)
    expect(@book.rentals.length).to eq 1
  end
end