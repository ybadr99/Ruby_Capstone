require_relative '../classes/author'
require_relative '../classes/item'
require 'date'

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

  describe '#to_hash' do
    it 'converts game to a hash' do
      expected_hash = {
        first_name: 'John',
        last_name: 'Doe'
      }
      expect(@author.to_hash).to eq(expected_hash)
    end
  end

  describe "#add_item" do
    it "adds an item to the author's items list and associates the author with the item" do
      author = Author.new("John", "Doe")
      item = Item.new("2022-01-15")

      author.add_item(item)

      expect(author.items).to include(item)
      expect(item.author).to eq(author)
    end
  end

end
