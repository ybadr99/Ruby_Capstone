module MusicAlbumModule
  def all_music_albums
    if @music_albums.empty?
      puts 'No Music Albums Available'
    else
      @music_albums.each do |album|
        puts "- #{album['label']} by #{album['author']} on #{album['published_date']}, " \
             "Genre: #{album['genre']['name']} On Spotify: #{album['on_spotify']}"
      end
    end
  end

  def all_genres
    if @genres.empty?
      puts 'No Genres Available'
    else
      @genres.each do |genre|
        puts "- #{genre['name']}"
      end
    end
  end

  def create_music_album
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
  end
end
