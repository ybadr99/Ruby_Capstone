require_relative 'item'

class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(1..100)
    @first_name = first_name
    @last_name = last_name

    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_hash
    { first_name: @first_name, last_name: @last_name }
  end
end
