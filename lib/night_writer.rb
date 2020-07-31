require_relative "file_reader"
require_relative "file_writer"
require_relative "dictionary"

class NightWriter

  attr_reader :reader,
              :writer,
              :dictionary

  def initialize
    # For testing: remove @ from argv wherever used when ready to run
    @ARGV = ["message.txt", "braille.txt"]
    @reader = FileReader.new
    @writer = FileWriter.new
    @dictionary = Dictionary.new
    # print_sample_line
  end

  def print_sample_line
    char_count = @reader.read(@ARGV[0]).chomp.length
    puts "Created '#{@ARGV[1]}' containing #{char_count} characters"
    "Created '#{@ARGV[1]}' containing #{char_count} characters"
  end

  def write_file
    translation = "hello world"
    @writer.write(translation, @ARGV[1])
  end

  def read_file
    message_string = @reader.read(@ARGV[0])
  end


end
# For testing that sample line prints correctly
# bob = NightWriter.new
# bob.write_file
# require "pry"; binding.pry
