# require modules here
require 'YAML'
require 'pry'

def load_library(file_path)
  emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |meaning, array|
    english, japanese = array
    emoticon_hash["get_emoticon"][english] = japanese
    emoticon_hash["get_meaning"][japanese] = meaning
  end
  emoticon_hash
  
end

def get_japanese_emoticon(file_path, emoticon)
  new_hash = load_library(file_path)
  japanese_emoticon = new_hash["get_emoticon"][emoticon]
  if japanese_emoticon
    japanese_emoticon
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  new_hash = load_library(file_path)
  english_meaning = new_hash["get_meaning"][emoticon]
  if english_meaning
    english_meaning
  else
    "Sorry, that emoticon was not found"
  end
end