require 'date'
class Item
  attr_accessor :published_date
  attr_reader :archived, :id

  def initialize(published_date)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = false
  end

  def can_be_archived?
    #    published_date =Time.now.year
    years_since_publication = Time.now.year - published_date
    years_since_publication > 10
  end

  def move_to_archive
    can_be_archived?
  end
end
