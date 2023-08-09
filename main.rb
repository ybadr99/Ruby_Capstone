require './classes/item'
require './classes/app'

def options_list()
  list = "
        Please choose an option by enterin a number (1-7):
        1 - List of all Books
        2 - List of all MusicAlbums
        3 - List of all Games
        4 - List all Genres
        5 - Add book
        6 - Add MusicAlbum
        7 - Add game
        8 - Exit
        print Choose an option:
        "
  puts list
  gets.chomp
end

def main
  app = App.new
  puts 'Welcome to Catalog of my things!'

  loop do
    puts "\nOptions:"
    number = options_list
    case number
    when '2'
      app.list_all_music_albums
    when '4'
      app.list_all_genres
    when '6'
      app.add_music_album
    when '8'
      puts 'Thank you for using this app Goodbye!'
      break
    else
      puts 'Invalid input'
      break
    end
  end
end

main
