module SaveData
  DATA_DIR = './save_load_data'.freeze

  # Save data to a JSON file
  def save_data(data, filename)
    File.write(File.join(DATA_DIR, filename), JSON.generate(data))
  end

  # Save an array of Book objects as JSON data
  def save_books(books)
    save_data(books.map do |book|
                { 'name' => book.name, 'publisher' => book.publisher, 'publish_date' => book.published_date,
                  'cover_state' => book.cover_state }
              end, 'books.json')
  end

  # Save an array of Label objects as JSON data
  def save_labels(labels)
    save_data(labels.map { |label| { 'title' => label.title, 'color' => label.color } }, 'labels.json')
  end
end

module LoadData
  DATA_DIR = './save_load_data'.freeze

  # Load data from a JSON file and create instances of the specified model class
  def load_data(filename, model_class)
    path = File.join(DATA_DIR, filename)
    return [] unless File.exist?(path) # Return an empty array if the file doesn't exist

    json_data = File.read(path)
    data_hash = JSON.parse(json_data)

    # Create instances of the specified model class using the data in the hash
    data_hash.map { |item| model_class.new(*item.values) }
  end

  # Load an array of Book objects from the 'books.json' file
  def load_books
    load_data('books.json', Book)
  end

  # Load an array of Label objects from the 'labels.json' file
  def load_labels
    load_data('labels.json', Label)
  end
end
