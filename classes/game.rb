require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(published_date, last_played_at, multiplayer)
    super(published_date)
    @last_played_at = Date.parse(last_played_at)
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && last_played_old_enough?
  end

  private

  def last_played_old_enough?
    current_date = Time.now
    year_diff = current_date.year - @last_played_at.year
    year_diff >= 2
  end
end

game1 = Game.new('1-1-2000', '1-1-2021')
puts game1.can_be_archived?
