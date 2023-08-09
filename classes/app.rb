require_relative 'item'
require_relative 'music_album'
require_relative 'genre'
require './preserve_data'

class App
  def initialize
    @music_albums = []
    @genres = []
    load_all_data_from_json
  end

#   Method to save data to json
  def save_all_data_to_json
    store_data_to_json('./music_albums.json', @music_albums)
    store_data_to_json('./genres.json', @genres)
  end

#   Method to load data from json
  def load_all_data_from_json
    @music_albums = load_data_from_json('./music_albums.json')
    @genres = load_data_from_json('./genres.json')
  end

# Methods to list all albums and genres 
# Also adds music album
  def list_all_music_albums
    puts "All Music Albums:"
    if @music_albums.empty?
        puts 'No Music Album Available'
      else
    @music_albums.each do |album|
      puts "- #{album['label']} by #{album['author']} on #{album['published_date']}, Genre: #{album['genre']['name']} On Spotify: #{album['on_spotify']}"
    end

end
  end

  def list_all_genres
    puts "All Genres:"
    if @genres.empty?
        puts 'No Genre Available'
    else
    @genres.each do |genre|
      puts "- #{genre['name']}"
    end
end
  end

  def add_music_album
    puts "\nAdd a New Music Album:"

    print "Genre: "
    genre_name = gets.chomp

    print "Author: "
    author = gets.chomp

    print "Source (CD/Digital): "
    source = gets.chomp

    print "Label: "
    label = gets.chomp

    print "Published Year: "
    published_date = gets.chomp
  
    print "On Spotify (true/false): "
    on_spotify = gets.chomp.downcase == 'true'

    genre = Genre.new(genre_name)
    music_album = MusicAlbum.new(genre, author, source, label, published_date, on_spotify)
    genre.add_item(music_album)

    @music_albums << music_album
    @genres << genre
    save_all_data_to_json
    puts "Music album added successfully!"
  end


#   Method to display options in terminal
  def start
    loop do
      puts "\nOptions:"
      puts "1. List all music albums"
      puts "2. List all genres"
      puts "3. Add a music album"
      puts "4. Exit"
      print "Choose an option: "

      choice = gets.chomp.to_i

      case choice
      when 1
        list_all_music_albums
      when 2
        list_all_genres
      when 3
        add_music_album
      when 4
        break
      else
        puts "Invalid choice!"
      end
    end
  end
end
