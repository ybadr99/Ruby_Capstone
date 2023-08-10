require_relative '../classes/genre'

describe Genre do
  let(:genre_name) { 'HipHop' }

  subject do
    Genre.new(genre_name)
  end

  describe '#initialize' do
    it 'sets attributes correctly' do
      expect(subject.name).to eq(genre_name)
      expect(subject.id).to be_an(Integer)
      expect(subject.items).to be_an(Array)
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      item = double('item')
      allow(item).to receive(:genre=)
      subject.add_item(item)
      expect(subject.items).to include(item)
    end

    it 'sets the genre of the added item' do
      item = double('item')
      expect(item).to receive(:genre=).with(subject)
      subject.add_item(item)
    end
  end

  describe '#to_hash' do
    it 'returns attributes as a hash' do
      hash = subject.to_hash
      expect(hash['name']).to eq(genre_name)
      expect(hash['id']).to eq(subject.id)
    end
  end
end
