require "minitest/autorun"
require "minitest/pride"
require "./lib/file_writer"

class FileWriterTest < Minitest::Test

  def setup
    @writer = FileWriter.new
  end

  def test_it_exists

    assert_instance_of FileWriter, @writer
  end

  def test_write
    translation = "o.\noo\n..\n"
    filename = "braille.txt"
    @writer.write(translation, filename)

    assert_equal "o.\noo\n..\n", File.read("braille.txt")
  end

end
