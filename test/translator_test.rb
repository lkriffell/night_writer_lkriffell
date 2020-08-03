require "./test/test_helper"

class TranslatorTest < Minitest::Test
  include Fileable

  def setup
    @translator = Translator.new
    write("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...", "braille.txt")
    write("hello world", "message.txt")
    write("hello world", "original_message.txt")
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end


# to braille tests
  def set_arguments_original_to_braille
    2.times do
      ARGV.pop
    end
    ARGV << "message.txt"
    ARGV << "braille.txt"
  end

  def test_create_sample_line_original_to_braille
    set_arguments_original_to_braille

    assert_equal "Created 'braille.txt' containing 68 characters", @translator.create_sample_line

    puts @translator.create_sample_line
  end

  def test_split_message
    set_arguments_original_to_braille
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

    assert_equal expected, @translator.split_message
  end

  def test_encode_to_braille
    set_arguments_original_to_braille
    expected = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", "..", "..", "..", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]

    assert_equal expected, @translator.encode_to_braille
  end

  def test_arrange_for_output
    set_arguments_original_to_braille
    expected = ["0.0.0.0.0....00.0.0.00", "00.00.0..0..00.0000..0", "....0.0.0....00.0.0..."]

    assert_equal expected, @translator.arrange_for_output.split("\n")
  end

  def test_determine_row_size
    set_arguments_original_to_braille
    split_braille = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]
    test_size_160 = ('1'..'159').to_a
    test_size_500 = ('1'..'500').to_a
    test_size_1000 = ('1'..'1000').to_a


    assert_equal 30, @translator.determine_row_size(split_braille)
    assert_equal 39, @translator.determine_row_size(test_size_160)
    assert_equal 38, @translator.determine_row_size(test_size_500)
    assert_equal 40, @translator.determine_row_size(test_size_1000)
  end

  def test_collect_one_third_of_each_char
    set_arguments_original_to_braille
    split_braille = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]

    assert_equal "0.0.0.0.0..00.0.0.00", @translator.collect_first_one_third_of_each_char(split_braille, 100).delete("\n")
    assert_equal "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0", @translator.collect_second_one_third_of_each_char(split_braille, 100).delete("\n")
    assert_equal "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0...", @translator.collect_third_one_third_of_each_char(split_braille, 100).delete("\n")
  end

# to english tests
  def set_arguments_braille_to_original
    2.times do
      ARGV.pop
    end
    ARGV << "braille.txt"
    ARGV << "original_message.txt"
  end

  def test_create_sample_line_braille_to_original
    set_arguments_braille_to_original

    assert_equal "Created 'original_message.txt' containing 11 characters", @translator.create_sample_line

    puts @translator.create_sample_line
  end

  def test_split_braille
    set_arguments_braille_to_original
    expected = [
                ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
                ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
                ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]
               ]

    assert_equal expected, @translator.split_braille
  end

  def test_collect_braille_characters
    set_arguments_braille_to_original
    expected = [
                "0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......",
                ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."
              ]

    assert_equal expected, @translator.collect_braille_characters
  end

  def test_form_braille_characters
    set_arguments_braille_to_original
    splitted_msg = [
                    ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
                    ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
                    ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]
                  ]

    expected = [
                "0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......",
                ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."
              ]

    assert_equal expected, @translator.form_braille_characters(splitted_msg)
  end

  def test_encode_to_english
    set_arguments_braille_to_original
    expected = "hello world"

    assert_equal expected, @translator.encode_to_english
  end

  def test_collect_each_char_by_position_on_line
    set_arguments_braille_to_original
    splitted_msg = [
                    ["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
                    ["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
                    ["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]
                  ]
    assert_equal ["0.00.."], @translator.collect_each_char_by_position_on_line(splitted_msg)
  end

  def test_check_position_on_line
    set_arguments_braille_to_original
    splitted_msg_1 = [""]
    splitted_msg_2 = [["h", "i"], ["o"]]

    assert_equal 0, @translator.check_position_on_line(splitted_msg_1)
    assert_equal 1, @translator.check_position_on_line(splitted_msg_2)
  end

  def test_append_each_line
    set_arguments_braille_to_original
    ordered_lines = {
                    0=>
                    [".0000.","0.00..",".00...",".00.0.","......",".00...",".00.0.","......","0.....","......",".0000.","0..0..",".00.0.",".0000.","......",".00.0.","0..00.","......",".0000.","0.00..","0.....",".0000.","......",".00...","......",".000.0",".00...","0.0.0.","0.0.0.","......","0.0...","0..0..","......","0.....","0.0..""0.0.0.","0..0..","......"],
                    1=>
                    [".0000.","0..00.","......",".0000.","0..0..","0.0.0.","0.0.0.","......",".00...","000...","......",".00...",".0000.","......","00....","0.....","00.00.","......","0.....","000.0.","000.0.","0..0..","00.00.","00.0..","......","00..0.","0...00","0.0.0.",".0000.",".00...","000.0.","0.0.0.","0..0..","......","0.0.0.",".00...","00.00.","0..0.."],
                    2=>
                    [".00.0."]}

    expected =              [".0000.","0.00..",".00...",".00.0.","......",".00...",".00.0.","......","0.....","......",".0000.","0..0..",".00.0.",".0000.","......",".00.0.","0..00.","......",".0000.","0.00..","0.....",".0000.","......",".00...","......",".000.0",".00...","0.0.0.","0.0.0.","......","0.0...","0..0..","......","0.....","0.0..""0.0.0.","0..0..","......",".0000.","0..00.","......",".0000.","0..0..","0.0.0.","0.0.0.","......",".00...","000...","......",".00...",".0000.","......","00....","0.....","00.00.","......","0.....","000.0.","000.0.","0..0..","00.00.","00.0..","......","00..0.","0...00","0.0.0.",".0000.",".00...","000.0.","0.0.0.","0..0..","......","0.0.0.",".00...","00.00.","0..0..",".00.0."]

    assert_equal expected, @translator.append_each_line(ordered_lines)
  end
end
