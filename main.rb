require './classes/item'

def options_list()
  list = "
        Please choose an option by enterin a number (1-7):
        1 - List of all Books
        2 - List of all MusicAlbums
        6 - List of all Games
        4 - Add book
        3 - Add MusicAlbum
        5 - Add game
        7 - Exit
        "
  puts list
  gets.chomp
end

def main
  puts 'Welcome to Catalog of my things!'
  number = options_list

  loop do
    case number
    when '7'
      puts 'Thank you for using this app Goodbye!'
    else
      puts 'Invalid input'
    end
    break
  end
end

main
