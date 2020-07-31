require "minitest/autorun"
require "minitest/pride"
require "./lib/night_writer"

class NightWriterTest < Minitest::Test
  def setup
    @encoder = NightWriter.new
  end

  def test_it_exists
    assert_instance_of NightWriter, @encoder
  end

  def test_it_has_attributes
    assert_instance_of FileReader, @encoder.reader
    assert_instance_of FileWriter, @encoder.writer
    assert_instance_of Dictionary, @encoder.dictionary
  end

  def test_print_sample_line
    assert_equal "Created 'braille.txt' containing 11 characters", @encoder.print_sample_line
  end

  def test_write_file
    @encoder.write_file("hello world", "braille.txt")

    assert_equal "hello world", File.read("braille.txt")
  end

  def test_read_file
    @encoder.write_file("hello world", "message.txt")
    expected = "hello world"

    assert_equal expected, @encoder.read_file
  end

  def test_split_message
    @encoder.write_file("hello world", "message.txt")
    expected = ["h", "e", "l", "l", "o", "w", "o", "r", "l", "d"]

    assert_equal expected, @encoder.split_message
  end

  def test_encode_to_braille
    @encoder.write_file("hello world", "message.txt")
    expected = ["o.", "oo", "..", "o.", ".o", "..", "o.", "o.", "o.", "o.", "o.", "o.", "o.", ".o", "o.", ".o", "oo", ".o", "o.", ".o", "o.", "o.", "oo", "o.", "o.", "o.", "o.", "oo", ".o", ".."]

    assert_equal expected, @encoder.encode_to_braille.split("\n")
  end
end
