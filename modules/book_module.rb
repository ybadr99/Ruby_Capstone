require_relative '../preserve_data'

module BookModule
  def all_books
    if @books.empty?
      puts 'No Books Available!'
    else
      @books.each_with_index do |book, i|
        puts "Book (#{i + 1}): #{book['name']}, Publisher: #{book['publisher']}  Cover State: #{book['cover_state']}"
      end
    end
  end

  def all_labels
    if @labels.empty?
      puts 'No Labels Available!'
    else
      @labels.each_with_index do |label, i|
        puts "Label (#{i + 1}): #{label['title']}, Color: #{label['color']} "
      end
    end
  end

  def add_book
    # Gather information to create a new book
    puts 'Kindly input name of the book.'
    book_name = gets.chomp

    puts 'Kindly input publisher of the book.'
    book_publisher = gets.chomp

    puts 'Kindly input date of publish of the book. [YYYY-MM-DD]'
    book_publish_date = gets.chomp

    puts 'Kindly input the cover state of the book? (Good/Bad)'
    book_cover_state = gets.chomp

    # Gather information to create a new label
    puts 'Kindly input title of the label  of the book? (e.g. Gift, New)'
    label_title = gets.chomp

    puts 'Kindly input the color of the label of the book?'
    label_color = gets.chomp

    # Create and return a new Label instance
    new_label = Label.new(label_title, label_color)

    # Create and return a new Book instance
    new_book = Book.new(book_name, book_publisher, book_publish_date, book_cover_state)

    @books << new_book
    @labels << new_label

    save_data('./data/books.json', @books)
    save_data('./data/labels.json', @labels)
    load_all_data_from_json
  end
end
