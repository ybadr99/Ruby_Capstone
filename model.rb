require 'json'

class Model
  def self.save_to(path, data_list)
    data = data_list.map(&:to_hash)
    File.write(path, JSON.pretty_generate(data))
  end

  def self.load_data(file_path, class_name)
    json_data = File.read(file_path)
    parsed_data = JSON.parse(json_data)
    parsed_data.map { |item| class_name.from_hash(item) }
  end
end
