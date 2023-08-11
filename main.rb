require_relative 'app'

def options_list()
  list = "
        Please choose an option by enterin a number (0-9):
        [1] - List all Books
        [2] - List all MusicAlbums
        [3] - List all Games
        [4] - List all genres
        [5] - List all labels
        [6] - List all Authors
        [7] - Add a book
        [8] - Add a music album
        [9] - Add a game
        [0] - Exit
        "
  puts list
  gets.chomp
end

def main
  app = App.new
  puts 'Welcome to Catalog of my things!'

  loop do
    number = options_list
    case number
    when '1'
      app.list_books
    when '2'
      app.list_all_music_albums
    when '3'
      app.list_all_games
    when '4'
      app.list_all_genres
    when '5'
      app.list_labels
    when '6'
      app.list_all_authors
    when '7'
      app.add_book
    when '8'
      app.add_music_album
    when '9'
      app.add_game
    when '0'
      puts 'Thank you for using this app Goodbye!'
      break
    else
      puts 'Invalid input'
      break
    end
  end
end
main