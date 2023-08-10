require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'save_load_data/save_data'
require_relative 'modules/book_label_module'
require 'json'

class App
  include SaveData
  include BookLabelModule


  def add_book
    create_book_label
  end

  def list_books
    list_books_m
  end

  def list_labels
    list_labels_m
  end
end
