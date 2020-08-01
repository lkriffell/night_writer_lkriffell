require_relative "file_reader"
require_relative "file_writer"
require_relative "dictionary"

class NightReader
  attr_reader :reader,
              :writer,
              :dictionary,
              :english

  def initialize
    # For testing: remove @ from argv wherever used when ready to run from comman line
    @ARGV = ["braille.txt", "original_message.txt"]
    @reader = FileReader.new
    @writer = FileWriter.new
    @dictionary = Dictionary.new
    # @braille = translate_for_output
    # write_file(@english, @ARGV[1])
    # Uncomment when ready to run
    # print_sample_line
  end

  def print_sample_line
    char_count = @reader.read(@ARGV[0]).chomp.length
    sample_line = "Created '#{@ARGV[1]}' containing #{char_count} characters"
    puts sample_line
    sample_line
  end

  def write_file(translation, filename)
    @writer.write(translation, filename)
  end

  def read_file
    message_string = @reader.read(@ARGV[0])
  end

  def split_message
    message_string = read_file
    split_lines = message_string.split("\n")
    split_line_chars = []
    split_lines.each do |line|
      split_line_chars << line.scan(/.{1,2}/m)
    end
    split_line_chars
  end

  def encode_to_english
    split_msg = split_message
    all_chars = []
    index = 0
    while index < split_msg[0].size
      full_braille_char = ''
      split_msg.each do |line|
        full_braille_char += line[index]
      end
      all_chars << full_braille_char
      index += 1
    end
    new_message = ''
    all_chars.map do |char|
      new_message += @dictionary.to_english_conversion[char]
    end
    new_message
  end
end
# night_reader = NightReader.new
# night_reader.write_file(night_reader.braille, ARGV[1])
# require "pry"; binding.pry
