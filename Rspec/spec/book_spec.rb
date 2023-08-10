require 'rspec'
require_relative '../../classes/book'


describe Book do
  let(:publish_date) { Date.new(2023, 8, 10) }
  let(:cover_state_good) { 'good' }
  let(:cover_state_bad) { 'bad' }

  describe '#initialize' do
    it 'creates a Book instance with the provided attributes' do
      name = 'Sample Book'
      publisher = 'Sample Publisher'
      cover_state = cover_state_good
      id = 42

      book = Book.new(name, publisher, publish_date, cover_state, id)

      expect(book.name).to eq(name)
      expect(book.publisher).to eq(publisher)
      expect(book.publish_date).to eq(publish_date)
      expect(book.cover_state).to eq(cover_state)
      expect(book.id).to eq(id)
    end
  end

  describe '#can_be_archived?' do
    context 'when cover state is good' do
      it 'returns false' do
        book = Book.new('Sample Book', 'Sample Publisher', publish_date, cover_state_good)

        expect(book.can_be_archived?).to be_falsey
      end
    end

    context 'when cover state is bad' do
      it 'returns true' do
        book = Book.new('Sample Book', 'Sample Publisher', publish_date, cover_state_bad)

        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'when cover state is good and publish date is old' do
      it 'returns true' do
        old_publish_date = publish_date - (10 * 365) # ten years ago
        book = Book.new('Sample Book', 'Sample Publisher', old_publish_date, cover_state_good)

        expect(book.can_be_archived?).to be_truthy
      end
    end
  end
end
