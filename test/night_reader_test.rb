require "./test/test_helper"
# require "minitest/autorun"
# require "minitest/pride"
# require "./lib/night_reader"

class NightReaderTest < Minitest::Test

  def setup
    @night_reader = NightReader.new
    @night_reader.write_file("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", "braille.txt")
    @night_reader.write_file("hello world", "message.txt")
  end

  def test_it_exists
    assert_instance_of NightReader, @night_reader
  end

  def test_it_has_attributes
    assert_instance_of FileReader, @night_reader.reader
    assert_instance_of FileWriter, @night_reader.writer
    assert_instance_of Dictionary, @night_reader.dictionary
  end

  def test_print_sample_line
    expected = "Created 'original_message.txt' containing 68 characters"

    assert_equal expected, @night_reader.print_sample_line
  end

  def test_write_file
    @night_reader.write_file("000..0.0.00.0...000.0.00.0\n....0.0.0.0..0..0.00.00.0.\n0...0.0...00....0.0.0.0.0.", "braille.txt")
    expected = "000..0.0.00.0...000.0.00.0\n....0.0.0.0..0..0.00.00.0.\n0...0.0...00....0.0.0.0.0."

    assert_equal expected, File.read("braille.txt")
  end

  def test_read_file
    expected = ["0.0.0.0.0....00.0.0.00", "00.00.0..0..00.0000..0", "....0.0.0....00.0.0..."]

    assert_equal expected, @night_reader.read_file.split("\n")
  end

  def test_split_message
    expected = [
                ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
                ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
                ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]
               ]

    assert_equal expected, @night_reader.split_message
  end

  def test_collect_braille_characters
    expected = [
                "0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......",
                ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."
              ]

    assert_equal expected, @night_reader.collect_braille_characters
  end

  def test_form_braille_characters
    splitted_msg = [
                    ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
                    ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
                    ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]
                  ]

    expected = [
                "0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......",
                ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."
              ]

    assert_equal expected, @night_reader.form_braille_characters(splitted_msg)
  end

  def test_encode_to_english
    expected = "hello world"

    assert_equal expected, @night_reader.encode_to_english
  end

  def test_append_each_line
    ordered_lines = {
                    0=>
                    [".0000.","0.00..",".00...",".00.0.","......",".00...",".00.0.","......","0.....","......",".0000.","0..0..",".00.0.",".0000.","......",".00.0.","0..00.","......",".0000.","0.00..","0.....",".0000.","......",".00...","......",".000.0",".00...","0.0.0.","0.0.0.","......","0.0...","0..0..","......","0.....","0.0..""0.0.0.","0..0..","......"],
                    1=>
                    [".0000.","0..00.","......",".0000.","0..0..","0.0.0.","0.0.0.","......",".00...","000...","......",".00...",".0000.","......","00....","0.....","00.00.","......","0.....","000.0.","000.0.","0..0..","00.00.","00.0..","......","00..0.","0...00","0.0.0.",".0000.",".00...","000.0.","0.0.0.","0..0..","......","0.0.0.",".00...","00.00.","0..0.."],
                    2=>
                    [".00.0."]}

    expected =              [".0000.","0.00..",".00...",".00.0.","......",".00...",".00.0.","......","0.....","......",".0000.","0..0..",".00.0.",".0000.","......",".00.0.","0..00.","......",".0000.","0.00..","0.....",".0000.","......",".00...","......",".000.0",".00...","0.0.0.","0.0.0.","......","0.0...","0..0..","......","0.....","0.0..""0.0.0.","0..0..","......",".0000.","0..00.","......",".0000.","0..0..","0.0.0.","0.0.0.","......",".00...","000...","......",".00...",".0000.","......","00....","0.....","00.00.","......","0.....","000.0.","000.0.","0..0..","00.00.","00.0..","......","00..0.","0...00","0.0.0.",".0000.",".00...","000.0.","0.0.0.","0..0..","......","0.0.0.",".00...","00.00.","0..0..",".00.0."]

    assert_equal expected, @night_reader.append_each_line(ordered_lines)
  end
end
