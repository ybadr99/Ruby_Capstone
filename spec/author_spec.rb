require_relative '../classes/author'
require_relative '../classes/item'

RSpec.describe Author do
  before do
    @author = Author.new('John', 'Doe')
  end

  describe '#initialize' do
    it 'sets the first_name and last_name attributes' do
      expect(@author.first_name).to eq('John')
      expect(@author.last_name).to eq('Doe')
    end

    it 'generates an id within the range 1..100' do
      expect(@author.id).to be >= 1
      expect(@author.id).to be <= 100
    end
  end

  describe '#add_item' do
    it 'adds an item to the author\'s items array' do
      item = Item.new('2011-01-01')
      @author.add_item(item)
      expect(@author.items).to include(item)
    end
  end

  describe '.from_hash' do
    it 'creates an author from hash data' do
      hash_data = {
        'first_name' => 'Yousef',
        'last_name' => 'Badr'
      }
      created_author = Author.from_hash(hash_data)
      expect(created_author.first_name).to eq('Yousef')
      expect(created_author.last_name).to eq('Badr')
    end
  end
end
