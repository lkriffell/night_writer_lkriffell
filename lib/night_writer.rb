require_relative "fileable"
require_relative "dictionary"
require_relative "translator"
include Fileable

  translator = Translator.new
  braille = translator.arrange_for_output
  write(braille, ARGV[1])
  puts translator.create_sample_line

# ruby ./lib/night_writer.rb message.txt braille.txt
