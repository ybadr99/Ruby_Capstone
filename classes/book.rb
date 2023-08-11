require_relative 'item'

class Book < Item
  attr_reader :id, :name, :publisher, :cover_state, :publish_date

  def initialize(name, publisher, publish_date, cover_state, id = Random.rand(1..1000))
    super(publish_date.to_s)
    @name = name
    @publisher = publisher
    @publish_date = publish_date
    @cover_state = cover_state
    @id = id
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def to_hash
    { name: @name, publisher: @publisher, publish_date: @publish_date, cover_state: @cover_state }
  end
end
