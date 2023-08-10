require_relative 'classes/item'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'save_load_data/save_data'
require_relative 'modules/book_label_module'
require_relative 'preserve_data'
require_relative 'logic/music_genre_logic'
require 'json'

class App
  include SaveData
  include BookLabelModule

  def initialize
    @music_albums = []
    @genres = []
    load_all_data_from_json
    @books = load_books
    @labels = load_labels
  end

  def add_book
    create_book_label
  end

  def list_books
    list_books_m
  end

  def list_labels
    list_labels_m
  end

  def save_all_data_to_json
    store_data_to_json('./data/music_albums.json', @music_albums)
    store_data_to_json('./data/genres.json', @genres)
  end

  def load_all_data_from_json
    @music_albums = load_data_from_json('./data/music_albums.json')
    @genres = load_data_from_json('./data/genres.json')
  end

  def list_all_music_albums
    list_all_music_albums_logic
  end

  def list_all_genres
    list_all_genres_logic
  end

  def add_music_album
    add_music_album_logic
  end
end
