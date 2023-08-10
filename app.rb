require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'preserve_data'
require 'json'

class App
  def initialize
    @music_albums = []
    @genres = []
    @books = []
    @labels = []
    load_all_data_from_json
  end

  def list_books
    puts 'All Music Albums:'
    if @books.empty?
      puts 'No Books Available!'
    else
      @books.each_with_index do |book, i|
        puts "Book (#{i + 1}): #{book['name']}, Publisher: #{book['publisher']}  Cover State: #{book['covercover_state']}"
      end
    end
    puts 'press enter if you want to continue'
    gets.chomp
  end

  def list_labels
    if @labels.empty?
      puts 'No Labels Available!'
    else
      @labels.each_with_index do |lable, i|
        puts "Lable (#{i + 1}): #{lable['title']}, Color: #{lable['color']} "
      end
    end
    puts 'press enter if you want to continue'
    gets.chomp
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
    puts 'Book added successfully!'

    puts 'press enter if you want to continue'
    gets.chomp
  end

  # #Music Album and genre
  def list_all_music_albums
    puts 'All Music Albums:'
    if @music_albums.empty?
      puts 'No Music Album Available'
    else
      @music_albums.each do |album|
        puts "- #{album['label']} by #{album['author']} on #{album['published_date']}, " \
             "Genre: #{album['genre']['name']} On Spotify: #{album['on_spotify']}"
      end

    end
    puts 'press enter if you want to continue'
    gets.chomp
  end

  def list_all_genres
    puts 'All Genres:'
    if @genres.empty?
      puts 'No Genre Available'
    else
      @genres.each do |genre|
        puts "- #{genre['name']}"
      end
    end
    puts 'press enter if you want to continue'
    gets.chomp
  end

  def add_music_album
    puts "\nAdd a New Music Album:"

    print 'Genre: '
    genre_name = gets.chomp

    print 'Author: '
    author = gets.chomp

    print 'Label: '
    label = gets.chomp

    print 'Published Year: '
    published_date = gets.chomp

    print 'On Spotify (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    genre = Genre.new(genre_name)
    music_album = MusicAlbum.new(genre, author, label, published_date, on_spotify)
    genre.add_item(music_album)

    @music_albums << music_album
    @genres << genre
    save_data('./data/music_albums.json', @music_albums)
    save_data('./data/genres.json', @genres)
    load_all_data_from_json
    puts 'Music album added successfully!'
    puts 'press enter if you want to continue'
    gets.chomp
  end

  #   Method to load data from json
  def load_all_data_from_json
    @music_albums = load_data('./data/music_albums.json')
    @genres = load_data('./data/genres.json')
    @books = load_data('./data/books.json')
    @labels = load_data('./data/labels.json')
  end
end
