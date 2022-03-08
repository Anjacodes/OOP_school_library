require_relative 'storage_manager.rb'
require_relative 'book.rb'
require './student'
require './teacher'

state = {book_list: [], people_list: [], rental_list: [], keep_going: true}

# state[:book_list] << Book.new("Title1", "Author1")
# state[:book_list] << Book.new("Title2", "Author2")
# state[:book_list] << Book.new("Title3", "Author3")
# state[:book_list] << Book.new("Title4", "Author4")
# state[:book_list] << Book.new("Title5", "Author5")

state[:people_list] << Student.new(12, "Name1", parent_permission: true)
state[:people_list] << Student.new(122, "Name2", parent_permission: true)
state[:people_list] << Student.new(123, "Name3", parent_permission: true)
state[:people_list] << Teacher.new("Spec1", 32, "Name1")
state[:people_list] << Teacher.new("Spec2", 48, "Name2")

storage_manager = StorageManager.new
# storage_manager.save_data(state)

# p(storage_manager.fetch_data(state))

storage_manager.save_data(state)

storage_manager.fetch_data(state)