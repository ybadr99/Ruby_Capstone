require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../save_load_data/save_data'

module BookLabelModule
  include SaveData
  include LoadData

  def initialize
    # Load existing books and labels from data files
    @books = load_books
    @labels = load_labels
  end

  def create_book_label
    # Create a new book and add it to the collection
    new_book = create_book
    @books << new_book
    save_books(@books)

    # Create a new label and add it to the collection
    new_label = create_label
    @labels << new_label
    save_labels(@labels)
  end

  def list_books_m
    # Display a list of books, if any
    display_items(@books, 'Books', lambda { |book|
                                     "Name: #{book.name} Publisher: #{book.publisher} Cover State: #{book.cover_state}"
                                   })
  end

  def list_labels_m
    # Display a list of labels, if any
    display_items(@labels, 'Labels', ->(label) { "Title: #{label.title} Color: #{label.color}" })
  end

  private

  def create_book
    # Gather information to create a new book
    puts 'Kindly input name of the book.'
    book_name = gets.chomp

    puts 'Kindly input publisher of the book.'
    book_publisher = gets.chomp

    puts 'Kindly input date of publish of the book. [YYYY-MM-DD]'
    book_publish_date = gets.chomp

    puts 'Kindly input the cover state of the book? (Good/Bad)'
    book_cover_state = gets.chomp

    # Create and return a new Book instance
    Book.new(book_name, book_publisher, book_publish_date, book_cover_state)
  end

  def create_label
    # Gather information to create a new label
    puts 'Kindly input title of the label  of the book? (e.g. Gift, New)'
    label_title = gets.chomp

    puts 'Kindly input the color of the label of the book?'
    label_color = gets.chomp

    # Create and return a new Label instance
    Label.new(label_title, label_color)
  end

  def display_items(items, title, item_format)
    if items.empty?
      # If there are no items, display a message
      puts "There are no #{title.downcase}\n\n"
    else
      # Display the list of items using the provided format
      puts "\n\n#{title}:\n"
      items.each { |item| puts item_format.call(item) }
    end
    puts
  end
end
