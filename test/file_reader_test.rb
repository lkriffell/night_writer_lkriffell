require "./test/test_helper"
# require "minitest/autorun"
# require "minitest/pride"
# require "./lib/file_reader"
# require "./lib/file_writer"

class FilereaderTest < Minitest::Test

  def setup
    @reader = FileReader.new
    @writer = FileWriter.new
  end

  def test_it_exists
    assert_instance_of FileReader, @reader
  end

  def test_read
    filename = "message.txt"
    @writer.write("hello world", filename)

    assert_equal "hello world", @reader.read(filename)
  end
end
