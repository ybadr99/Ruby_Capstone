module GameModule
  def all_games
    puts 'There is no Games' if @games.empty?
    @games.each_with_index do |game, i|
      puts "Game (#{i}) : #{game['name']}, last_played_at: #{game['last_played_at']}, published_date:#{game['published_date']}, author:#{game['author']['first_name'] + game['author']['last_name']}"
    end
  end

  def all_authors
    puts 'There is no Games' if @authors.empty?
    @authors.each_with_index do |author, i|
      puts "author (#{i + 1}): #{author['first_name']} #{author['last_name']}"
    end
  end

  def create_game
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

    print 'author first name: '
    fname = gets.chomp

    print 'author last name: '
    lname = gets.chomp

    new_author = Author.new(fname, lname)

    new_game = Game.new(game_name, p_date, last_played_at, is_multiplayer, new_author)

    @games.push(new_game)
    @authors.push(new_author)

    save_data('./data/games.json', @games)
    save_data('./data/authors.json', @authors)

    load_all_data_from_json

  end
end
