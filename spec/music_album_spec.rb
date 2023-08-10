require_relative '../classes/music_album'
require_relative '../classes/genre'

describe MusicAlbum do
  let(:published_date) { '2020-02-12' }
  let(:genre) { Genre.new('HipHop') }
  let(:author) { 'J. Cole' }
  let(:label) { 'Forest Hill Drive' }
  let(:on_spotify) { true }

  subject do
    MusicAlbum.new(genre, author, label, published_date, on_spotify)
  end

  describe '#initialize' do
    it 'sets attributes correctly' do
      expect(subject.published_date).to eq(Date.parse(published_date))
      expect(subject.genre).to eq(genre)
      expect(subject.author).to eq(author)
      expect(subject.label).to eq(label)
      expect(subject.on_spotify).to eq(on_spotify)
    end
  end

  describe '#to_hash' do
    it 'returns attributes as a hash' do
      hash = subject.to_hash
      expect(hash['published_date']).to eq(Date.parse(published_date))
      expect(hash['label']).to eq(label)
      expect(hash['author']).to eq(author)
      expect(hash['on_spotify']).to eq(on_spotify)
      expect(hash['genre']).to eq(genre.to_hash)
    end
  end

  describe '#can_be_archived?' do
    context 'when album is over 10 years old and on Spotify' do
      it 'returns true' do
        allow(subject).to receive(:on_spotify).and_return(true)
        allow(subject.published_date).to receive(:year).and_return(Time.now.year - 11)
        result = subject.send(:can_be_archived?)
        expect(result).to be true
      end
    end

    context 'when album is not over 10 years old' do
      it 'returns false' do
        allow(subject).to receive(:on_spotify).and_return(true)
        allow(subject.published_date).to receive(:year).and_return(Time.now.year - 9)
        result = subject.send(:can_be_archived?)
        expect(result).to be false
      end
    end

    context 'when album is over 10 years old but not on Spotify' do
      it 'returns false' do
        allow(subject).to receive(:on_spotify).and_return(false)
        allow(subject.published_date).to receive(:year).and_return(Time.now.year - 11)
        result = subject.send(:can_be_archived?)
        expect(result).to be false
      end
    end
  end
end
