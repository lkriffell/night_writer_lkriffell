require_relative "fileable"
require_relative "dictionary"

class NightWriter
  include Fileable

  attr_reader :dictionary,
              :braille

  def initialize
    # For testing: remove @ from argv wherever used when ready to run from command line
    @ARGV = ["message.txt", "braille.txt"]
    @dictionary = Dictionary.new
    @fully_translated_for_output = ""
    @position_on_first_line = 0
    @position_on_second_line = 1
    @position_on_third_line = 2
    # Uncomment when ready to run
    # @braille = arrange_for_output
    # write(@braille, ARGV[1])
    # puts create_sample_line
    # ---------------
  end

  def create_sample_line
    char_count = read(@ARGV[0]).chomp.length
    "Created '#{@ARGV[1]}' containing #{char_count} characters"
  end

  def split_message
    message_string = read(@ARGV[0])
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

  def determine_row_size(split_braille)
    denominator = 1
    row_size = nil
    while row_size.nil?
      if split_braille.size / denominator <= 40
        row_size = split_braille.size / denominator
      end
      denominator += 1
    end
    row_size
  end

  def arrange_for_output
    split_braille = encode_to_braille
    char_count_by_row = determine_row_size(split_braille)
    while split_braille.size > @position_on_third_line
      collect_first_one_third_of_each_char(split_braille, char_count_by_row)
      collect_second_one_third_of_each_char(split_braille, char_count_by_row)
      collect_third_one_third_of_each_char(split_braille, char_count_by_row)
    end
    @fully_translated_for_output
  end

  def collect_first_one_third_of_each_char(split_braille, char_count_by_row)
    char_count_by_row.times do
      if split_braille[@position_on_first_line] != nil
        @fully_translated_for_output += split_braille[@position_on_first_line]
        @position_on_first_line += 3
      end
    end
    @fully_translated_for_output += "\n"
  end

  def collect_second_one_third_of_each_char(split_braille, char_count_by_row)
    char_count_by_row.times do
      if split_braille[@position_on_second_line] != nil
        @fully_translated_for_output += split_braille[@position_on_second_line]
        @position_on_second_line += 3
      end
    end
    @fully_translated_for_output += "\n"
  end

  def collect_third_one_third_of_each_char(split_braille, char_count_by_row)
    char_count_by_row.times do
      if split_braille[@position_on_third_line] != nil
        @fully_translated_for_output += split_braille[@position_on_third_line]
        @position_on_third_line += 3
      end
    end
    @fully_translated_for_output += "\n"
  end
end
# ruby ./lib/night_writer.rb message.txt braille.txt
# encoder = NightWriter.new
