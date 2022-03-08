require_relative 'storage_manager.rb'
require_relative 'book.rb'

state = {book_list: [], people_list: [], rental_list: [], keep_going: true}

# state[:book_list] << Book.new("Title1", "Author1")
# state[:book_list] << Book.new("Title2", "Author2")
# state[:book_list] << Book.new("Title3", "Author3")
# state[:book_list] << Book.new("Title4", "Author4")
# state[:book_list] << Book.new("Title5", "Author5")

storage_manager = StorageManager.new
# storage_manager.save_data(state)

p(storage_manager.fetch_data(state))