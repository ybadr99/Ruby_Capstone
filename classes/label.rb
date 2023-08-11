require_relative 'item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.new_label = self
  end

  def to_hash
    { title: @title, color: @color }
  end
end
