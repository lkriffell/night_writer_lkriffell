require "./test/test_helper"

class NightReaderTest < Minitest::Test
  include Fileable

  def setup
    @night_reader = NightReader.new
    write("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", "braille.txt")
    write("hello world", "message.txt")
  end

  def test_it_exists
    assert_instance_of NightReader, @night_reader
  end

  def test_it_has_attributes
    assert_instance_of Dictionary, @night_reader.dictionary
  end

  def test_create_sample_line
    expected = "Created 'original_message.txt' containing 68 characters"

    assert_equal expected, @night_reader.create_sample_line
    puts @night_reader.create_sample_line
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

  def test_collect_each_char_by_position_on_line
    splitted_msg = [
                    ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
                    ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
                    ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]
                  ]
    # collect_each_char_by_position_on_line collects the same index from each line
    assert_equal ["0.00.."], @night_reader.collect_each_char_by_position_on_line(splitted_msg)
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
