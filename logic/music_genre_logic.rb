require_relative '../classes/music_album'
require_relative '../classes/genre'

def list_all_music_albums_logic
  puts 'All Music Albums:'
  if @music_albums.empty?
    puts 'No Music Album Available'
  else
    @music_albums.each do |album|
      puts "- #{album['label']} by #{album['author']} on #{album['published_date']}, " \
           "Genre: #{album['genre']['name']}, On Spotify: #{album['on_spotify']}"
    end

  end
end

def list_all_genres_logic
  puts 'All Genres:'
  if @genres.empty?
    puts 'No Genre Available'
  else
    @genres.each do |genre|
      puts "- #{genre['name']}"
    end
  end
end

def add_music_album_logic
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
  save_all_data_to_json
  load_all_data_from_json
  puts 'Music album added successfully!'
end
