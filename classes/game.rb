require 'date'
require_relative 'item'
require_relative '../model'
require 'json'
class Game < Item
  attr_accessor :name, :last_played_at, :multiplayer

  def initialize(name, published_date, last_played_at, multiplayer)
    super(published_date)
    @name = name
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

  public

  def to_hash
    { name: @name, published_date: published_date, last_played_at: @last_played_at, multiplayer: @multiplayer }
  end

  def self.from_hash(data)
    new(data['name'], data['published_date'], data['last_played_at'], data['multiplayer'])
  end
end
