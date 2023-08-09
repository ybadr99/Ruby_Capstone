require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'model'

class App
  def initialize
    @games = Model.load_data('./data/games.json', Game)
    @authors = Model.load_data('./data/authors.json', Author)
  end

  def all_games
    puts 'There is no Games' if @games.empty?
    @games.each_with_index do |game, i|
      puts "Game (#{i}) : #{game.name}, last_played_at: #{game.last_played_at.year}"
    end
    puts 'Press Enter to continue!'
    gets.chomp
    options_list
  end

  def all_authors
    puts 'There is no Games' if @authors.empty?
    @authors.each_with_index do |author, i|
      puts "author (#{i + 1}): #{author.first_name} #{author.last_name}"
    end
    puts 'Press Enter to continue!'
    gets.chomp
    options_list
  end

  def add_game
    print 'Game name:'
    game_name = gets.chomp
    print 'is multipalyer? [Y/N]:'
    multipalyer_decision = gets.chomp
    is_multiplayer = true if %w[Y y].include?(multipalyer_decision)
    is_multiplayer = false if %w[N n].include?(multipalyer_decision)

    print 'last time you played this game:'
    last_played_at = gets.chomp
    print 'published date: '
    p_date = gets.chomp

    new_game = Game.new(game_name, p_date, last_played_at, is_multiplayer)
    @games.push(new_game)

    Model.save_to('./data/games.json', @games)
    puts 'New game saved!'
    puts 'Press Enter to continue!'
    gets.chomp
    options_list
  end
end
