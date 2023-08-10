require 'json'

def save_data(file_name, data)
  File.open(file_name, 'w') do |file|
    hashed_data = data.map(&:to_hash)
    file.write(JSON.pretty_generate(hashed_data))
  end
end

def load_data(file)
  if File.exist?(file)
    if File.empty?(file)
      []
    else
      file_data = File.read(file)
      JSON.parse(file_data)
    end
  else
    []
  end
end
