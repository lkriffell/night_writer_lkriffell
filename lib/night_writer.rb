require_relative "fileable"
require_relative "dictionary"
require_relative "translator"
include Fileable

  if ARGV == [] || ARGV == ["braille.txt", "original_message.txt"]
    2.times do
      ARGV.pop
    end
    ARGV << "message.txt"
    ARGV << "braille.txt"
  end

  translator = Translator.new
  braille = translator.arrange_for_output
  write(braille, ARGV[1])
  puts translator.create_sample_line
  
# ruby ./lib/night_writer.rb message.txt braille.txt
