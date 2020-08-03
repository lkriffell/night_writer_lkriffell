require_relative "fileable"
require_relative "dictionary"
require_relative "translator"
include Fileable

  translator = Translator.new
  english = translator.encode_to_english
  write(english, ARGV[1])
  puts translator.create_sample_line

# ruby ./lib/night_reader.rb braille.txt original_message.txt
