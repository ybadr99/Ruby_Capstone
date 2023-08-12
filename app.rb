require_relative 'classes/music_album'
require_relative 'classes/genre'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'modules/book_module'
require_relative 'modules/music_module'
require_relative 'modules/game_module'
require_relative 'preserve_data'
require 'json'

class App
  include BookModule
  include MusicAlbumModule
  include GameModule

  def initialize
    @music_albums = []
    @genres = []
    @books = []
    @labels = []
    @games = []
    @authors = []
    load_all_data_from_json
  end

  def list_books
    puts 'All Books:'
    all_books
    puts 'press enter if you want to continue'
    gets.chomp
  end

  def list_labels
    puts 'All Labels:'
    all_labels
    puts 'press enter if you want to continue'
    gets.chomp
  end

  def create_book
    puts 'Add a New Book:'
    add_book
    puts 'Book added successfully!'
    puts 'press enter if you want to continue'
    gets.chomp
  end

  # Music Album and genre
  def list_all_music_albums
    puts 'All Music Albums:'
    all_music_albums
    puts 'press enter if you want to continue'
    gets.chomp
  end

  def list_all_genres
    puts 'All Genres:'
    all_genres
    puts 'press enter if you want to continue'
    gets.chomp
  end

  def add_music_album
    puts 'Add a New Music Album:'
    create_music_album
    puts 'Music album added successfully!'
    puts 'press enter if you want to continue'
    gets.chomp
  end

  # game and author
  def list_all_games
    puts 'All games:'
    all_games
    puts 'Press Enter to continue!'
    gets.chomp
  end

  def list_all_authors
    puts 'All games:'
    all_authors
    puts 'Press Enter to continue!'
    gets.chomp
  end

  def add_game
    puts 'Add a New Game:'
    create_game
    puts 'Game added successfully!'
    puts 'press enter if you want to continue'
    gets.chomp
  end

  # Method to load data
  def load_all_data_from_json
    @music_albums = load_data('./data/music_albums.json')
    @genres = load_data('./data/genres.json')
    @books = load_data('./data/books.json')
    @labels = load_data('./data/labels.json')
    @games = load_data('./data/games.json')
    @authors = load_data('./data/authors.json')
  end
end
