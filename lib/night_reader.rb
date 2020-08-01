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
    # Uncomment when ready to run
    # @english = encode_to_english
    # write_file(@english, ARGV[1])
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
    @reader.read(@ARGV[0])
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

  def form_braille_characters
    split_msg = split_message
    formed_chars = []
    index = 0
    counter = 0
    first_line = 0
    third_line = 2
    while counter <= split_msg[0].size * split_msg.size
      one_char = ''
      if split_msg[first_line..third_line] != nil
        split_msg[first_line..third_line].each do |line|
          if line[index] != nil
            one_char += line[index]
          end
        end
      end
      if index == split_msg[0].size - 1
        index = 0
        first_line += 3
        third_line += 3
        counter += 1
      else
        index += 1
        counter += 1
      end
      if one_char != ""
        formed_chars << [one_char]
      end
    end
    formed_chars
  end

  def encode_to_english
    formed_chars = form_braille_characters
    original_message = ''
    if formed_chars != nil
      formed_chars.each do |char|
          original_message += @dictionary.to_english_conversion[char[0]]
        end
    end
    original_message
  end
end
# ruby ./lib/night_reader.rb braille.txt original_message.txt
# night_reader = NightReader.new
