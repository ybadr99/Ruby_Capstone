require 'rspec'
require_relative '../../classes/label'

describe Label do
  let(:color) { 'Yellow' }
  let(:title) { 'Atomic' }
  let(:label) { Label.new(title, color) }
  describe '#initialize' do
    it 'inputs color and title' do
      expect(label.color).to eq('Yellow')
      expect(label.title).to eq('Atomic')
    end
  end
end
