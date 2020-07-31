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
    @writer.write(translation)

    assert_equal "o.\noo\n..\n", File.read("braille.txt")
  end

end
