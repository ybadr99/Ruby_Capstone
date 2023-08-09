require_relative 'item'

class MusicAlbum < Item
    attr_accessor :on_spotify

    def initialize(genre, author, source, label, published_date, on_spotify)
        super(published_date)
        @on_spotify = on_spotify
        @label = label
        @author = author
        @genre = genre
    end


  def to_hash
    {
    'published_date'=> published_date,
      'label'=> label,
      'author'=> author,
      'on_spotify'=> on_spotify,
      'genre' => genre.to_hash
      }
  end

    private
    def can_be_archived?
        super && on_spotify
    end
end



