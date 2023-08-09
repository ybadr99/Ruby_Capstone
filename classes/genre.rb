require_relative 'item'

class Genre
    attr_accessor :id, :name, :items
    def initialize(name)
        @id = Random.rand(1..100)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
        item.genre = self
    end

    def to_hash
        {
        'id'=> id,
          'name'=> name
          }
      end
end





