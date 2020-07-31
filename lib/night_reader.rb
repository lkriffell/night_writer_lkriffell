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
    @ARGV = ["message.txt", "braille.txt"]
    @reader = FileReader.new
    @writer = FileWriter.new
    @dictionary = Dictionary.new
    # @braille = translate_for_output
    # write_file(@english, @ARGV[1])
    # Uncomment when ready to run
    # print_sample_line
  end
end
