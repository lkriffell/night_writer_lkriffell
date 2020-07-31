require_relative "file_reader"
require_relative "file_writer"
require_relative "dictionary"

class NightWriter

  attr_reader :reader,
              :writer,
              :dictionary
  def initialize
    @reader = FileReader.new
    @writer = FileWriter.new
    @dictionary = Dictionary.new
  end

end
