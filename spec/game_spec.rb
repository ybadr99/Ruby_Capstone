require_relative '../classes/game'
require_relative '../classes/author'

RSpec.describe Game do
  before do
    @author  = Author.new('yousef', "mohamed")
    @game = Game.new('Test Game', '2011-01-01', '2021-01-01', true,@author )
  end

  describe '#can_be_archived?' do
    context 'when the game is old enough' do
      it 'returns true' do
        expect(@game.can_be_archived?).to be(true)
      end
    end

    context 'when the game is not old enough' do
      it 'returns false' do
        @game.instance_variable_set(:@last_played_at, Time.now) # Set last_played_at to today
        expect(@game.can_be_archived?).to be(false)
      end
    end
  end

  describe '#to_hash' do
    it 'converts game to a hash' do
      expected_hash = {
        name: 'Test Game',
        published_date: Date.parse('2011-01-01'),
        last_played_at: Date.parse('2021-01-01'),
        multiplayer: true,
        "author": {
          "first_name": "yousef",
          "last_name": "mohamed"
        }
      }
      expect(@game.to_hash).to eq(expected_hash)
    end
  end

end
