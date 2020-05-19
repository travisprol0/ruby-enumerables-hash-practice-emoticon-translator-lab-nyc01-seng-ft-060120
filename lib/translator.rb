require 'yaml'
require 'pry'


def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  emoticons.each do |emotion_string, emoticon_array|
    new_hash[emotion_string] = {}
    new_hash[emotion_string][:english] = emoticon_array[0]
    new_hash[emotion_string][:japanese] = emoticon_array[1]
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  emoji = emoticons.values.find {|faces| faces[0] == emoticon}
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[1]
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  emoji = emoticons.find {|name, faces| faces[1] == emoticon }
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[0]
end
