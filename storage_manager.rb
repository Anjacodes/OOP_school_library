require_relative './input.rb'
require_relative './output.rb'

class StorageManager
  def initialize
    @path = './data'
    @input = Input.new(@path)
    @output = Output.new(@path)
  end

  def fetch_data(state)
    @input.read_books(state)
    @input.read_people(state)
  end

  def save_data(state)
    @output.create_files
    @output.save_books(state)
    @output.save_people(state)
  end
end