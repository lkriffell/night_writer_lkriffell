require "minitest/autorun"
require "minitest/pride"
require "./lib/night_writer"

class NightWriterTest < Minitest::Test
  def setup
    @encoder = NightWriter.new
    @encoder.write_file("hello world", "message.txt")
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
    @encoder.write_file("hello world", "message.txt")

    assert_equal "hello world", File.read("message.txt")
  end

  def test_read_file
    expected = "hello world"

    assert_equal expected, @encoder.read_file
  end

  def test_split_message
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

    assert_equal expected, @encoder.split_message
  end

  def test_encode_to_braille
    expected = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", "..", "..", "..", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]

    assert_equal expected, @encoder.encode_to_braille.split("\n")
  end

  def test_translate_for_output
    expected = ["00.00.0..0..00.0000..0", "....0.0.0....00.0.0..."]

    assert_equal expected, @encoder.translate_for_output.split("\n")
  end

  def test_determine_row_count
    split_braille = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]

    assert_equal 10, @encoder.determine_row_count(split_braille)
  end
end
