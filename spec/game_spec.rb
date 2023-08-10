require_relative '../classes/game'

RSpec.describe Game do
  before do
    @game = Game.new('Test Game', '2011-01-01', '2021-01-01', true)
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
        multiplayer: true
      }
      expect(@game.to_hash).to eq(expected_hash)
    end
  end

  describe '.from_hash' do
    it 'creates game from hash data' do
      hash_data = {
        'name' => 'Test Game',
        'published_date' => '2011-01-01',
        'last_played_at' => '2021-01-01',
        'multiplayer' => true
      }
      expected_game = Game.new('Test Game', '2011-01-01', '2021-01-01', true)
      expect(Game.from_hash(hash_data).to_hash).to eq(expected_game.to_hash)
    end
  end
end
