require_relative "fileable"

class Translator
  include Fileable

  def initialize
    @dictionary = Dictionary.new
# To braille variables
    @position_on_line = 0
    @formed_chars = []
# to english variables
    @fully_translated_for_output = ""
    @position_on_first_line = 0
    @position_on_second_line = 1
    @position_on_third_line = 2
  end

  def create_sample_line
    char_count = read(ARGV[1]).chomp.length
    "Created '#{ARGV[1]}' containing #{char_count} characters"
  end
# To english conversion

  def split_message
    message_string = read(ARGV[0])
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

# to braille conversion
  def split_braille
    message_string = read(ARGV[0])
    split_lines = message_string.split("\n")
    split_line_chars = split_lines.map do |line|
      line.scan(/.{1,2}/m)
    end
    split_line_chars
  end

  def collect_braille_characters
    splitted_braille = split_braille
    form_braille_characters(splitted_braille)
  end

  def encode_to_english
    all_chars = collect_braille_characters
    original_message = ''
    all_chars.each do |char|
      original_message += @dictionary.to_english_conversion[char]
    end
    original_message
  end

  def form_braille_characters(splitted_braille)
    while @position_on_line < splitted_braille[0].size
      collect_each_char_by_position_on_line(splitted_braille)
      check_position_on_line(splitted_braille)
    end
    order_characters_by_line
  end

  def collect_each_char_by_position_on_line(splitted_braille)
    each_char_at_postion = ''
    splitted_braille.each do |line|
      if line[@position_on_line] != nil
        each_char_at_postion += line[@position_on_line]
      end
    end
    @formed_chars << each_char_at_postion
  end

  def check_position_on_line(splitted_braille)
    if @position_on_line == splitted_braille[0].size
      @position_on_line = 0
    else
      @position_on_line += 1
    end
  end

  def order_characters_by_line
    ordered_lines = Hash.new { |hash, key| hash[key] = []}
    collect_chars_by_position_on_line(ordered_lines)
    append_each_line(ordered_lines)
  end

  def collect_chars_by_position_on_line(ordered_lines)
    @formed_chars.each do |chars|
      chars_with_matching_line_position = chars.scan(/.{1,6}/m)
      index = 0
      chars_with_matching_line_position.each do |char|
        ordered_lines[index] << chars_with_matching_line_position[index]
        index += 1
      end
    end
  end

  def append_each_line(ordered_lines)
    full_message = []
    ordered_lines.values.flatten.each do |line|
      full_message << line
    end
    full_message
  end
end
