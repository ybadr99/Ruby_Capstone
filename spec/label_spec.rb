require_relative '../classes/label'
require_relative '../classes/item'
require 'date'

RSpec.describe Label do
  let(:color) { 'Yellow' }
  let(:title) { 'Atomic' }
  let(:label) { Label.new(title, color) }
  describe '#initialize' do
    it 'inputs color and title' do
      expect(label.color).to eq('Yellow')
      expect(label.title).to eq('Atomic')
    end
  end

  describe '#to_hash' do
    it 'converts label to a hash' do
      expected_hash = {
        title: 'Important',
        color: 'red'
      }
      label = Label.new('Important', 'red')

      expect(label.to_hash).to eq(expected_hash)
    end
  end

  describe '#add_item' do
    it "associates an item with the label and adds it to the label's items list" do
      label = Label.new('Important', 'red')
      item = Item.new('2022-01-15')

      label.add_item(item)

      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end
  end
end
