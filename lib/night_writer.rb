require_relative "file_reader"
require_relative "file_writer"
require_relative "dictionary"

class NightWriter

  attr_reader :reader,
              :writer,
              :dictionary,
              :braille

  def initialize
    # For testing: remove @ from argv wherever used when ready to run from comman line
    @ARGV = ["message.txt", "braille.txt"]
    @reader = FileReader.new
    @writer = FileWriter.new
    @dictionary = Dictionary.new
    # Uncomment when ready to run
    # @braille = translate_for_output
    # write_file(@braille, ARGV[1])
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
    message_string.chomp.split("")
  end

  def encode_to_braille
    split_msg = split_message
    new_message = ''
    split_msg.each do |char|
      new_message += @dictionary.to_braille_conversion[char]
    end
    new_message.scan(/.{1,2}/m)
  end

  def determine_row_count(split_braille)
    if split_braille.size < 80
      split_braille.size / 3 #3 rows
    elsif split_braille.size >= 80 && split_braille.size < 160
      split_braille.size / 6 #6 rows
    elsif split_braille.size >= 160 && split_braille.size < 240
      split_braille.size / 9 #9 rows
    elsif split_braille.size >= 240 && split_braille.size < 320
      split_braille.size / 12 #12 rows
    end
  end

  def translate_for_output
    split_braille = encode_to_braille
    char_count_by_row = determine_row_count(split_braille)
    message_to_output = ""
    first_index = 0
    second_index = 1
    third_index = 2
    while split_braille.size > third_index
      char_count_by_row.times do
        message_to_output += split_braille[first_index]
        first_index += 3
      end
      message_to_output += "\n"
      char_count_by_row.times do
        message_to_output += split_braille[second_index]
        second_index += 3
      end
      message_to_output += "\n"
      char_count_by_row.times do
        message_to_output += split_braille[third_index]
        third_index += 3
      end
      message_to_output += "\n"
    end
    message_to_output
  end


end
# encoder = NightWriter.new
