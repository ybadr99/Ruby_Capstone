require_relative '../classes/item'
require 'date'

describe Item do
  describe '#move_to_archive' do
    context 'when the item can be archived' do
      it 'archives the item' do
        published_date = (Date.today - (11 * 365)).to_s # Assuming the item was published more than 10 years ago
        item = Item.new(published_date)

        expect(item.archived).to eq(false)
        item.move_to_archive
        expect(item.archived).to eq(true)
      end
    end

    context 'when the item cannot be archived' do
      it 'does not archive the item' do
        published_date = Date.today.to_s # Assuming the item was published today
        item = Item.new(published_date)

        expect(item.archived).to eq(false)
        item.move_to_archive
        expect(item.archived).to eq(false)
      end
    end
  end
end
