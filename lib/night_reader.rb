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
    @position_on_line = 0
    @formed_chars = []
    # Uncomment when ready to run
    @english = encode_to_english
    write_file(@english, ARGV[1])
    print_sample_line
  end

  def print_sample_line
    char_count = @reader.read(ARGV[0]).chomp.length
    sample_line = "Created '#{ARGV[1]}' containing #{char_count} characters"
    puts sample_line
    sample_line
  end

  def write_file(translation, filename)
    @writer.write(translation, filename)
  end

  def read_file
    @reader.read(ARGV[0])
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

  def collect_braille_characters
    splitted_msg = split_message
    form_braille_characters(splitted_msg)
  end

  def encode_to_english
    all_chars = collect_braille_characters
    original_message = ''
    all_chars.each do |char|
      original_message += @dictionary.to_english_conversion[char]
    end
    original_message
  end

  def form_braille_characters(splitted_msg)
    while @position_on_line < splitted_msg[0].size
      one_char = ''
      splitted_msg.each do |line|
          one_char += line[@position_on_line]
      end
      @formed_chars << one_char
      check_position_on_line(splitted_msg)
    end
    order_characters_by_line
  end

  def check_position_on_line(splitted_msg)
    if @position_on_line == splitted_msg[0].size
      @position_on_line = 0
    else
      @position_on_line += 1
    end
  end

  def order_characters_by_line
    ordered_lines = Hash.new { |hash, key| hash[key] = []}
    @formed_chars.each do |chars|
      chars_with_matching_line_position = chars.scan(/.{1,6}/m)
      ordered_lines[:line_one] << chars_with_matching_line_position[0]
      ordered_lines[:line_two] << chars_with_matching_line_position[1]
      ordered_lines[:line_three] << chars_with_matching_line_position[2]
      ordered_lines[:line_four] << chars_with_matching_line_position[3]
    end
    all_ordered_chars = (ordered_lines[:line_one] + ordered_lines[:line_two] + ordered_lines[:line_three] + ordered_lines[:line_four]).compact
  end
end
# ruby ./lib/night_reader.rb braille.txt original_message.txt
night_reader = NightReader.new
