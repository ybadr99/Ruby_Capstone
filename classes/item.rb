require 'date'
class Item
  attr_accessor :genre, :author, :source, :label, :published_date
  attr_reader :archived, :id

  def initialize(published_date)
    @id = Random.rand(1..1000)
    @published_date = Date.parse(published_date)
    @archived = false
  end

  def author(new_author)
    @author = new_author
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Time.now
    year_diff = current_date.year - @published_date.year
    return false if year_diff < 10

    true
  end
end
