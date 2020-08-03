require "./test/test_helper"

class NightWriterTest < Minitest::Test
  include Fileable

  def setup
    @encoder = NightWriter.new
    write("hello world", "message.txt")
  end

  def test_it_exists
    assert_instance_of NightWriter, @encoder
  end

  def test_it_has_attributes
    assert_instance_of Dictionary, @encoder.dictionary
  end

  def test_create_sample_line
    assert_equal "Created 'braille.txt' containing 11 characters", @encoder.create_sample_line
    puts @encoder.create_sample_line
  end

  def test_split_message
    expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]

    assert_equal expected, @encoder.split_message
  end

  def test_encode_to_braille
    expected = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", "..", "..", "..", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]

    assert_equal expected, @encoder.encode_to_braille
  end

  def test_arrange_for_output
    expected = ["0.0.0.0.0....00.0.0.00", "00.00.0..0..00.0000..0", "....0.0.0....00.0.0..."]

    assert_equal expected, @encoder.arrange_for_output.split("\n")
  end

  def test_determine_row_size
    split_braille = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]
    test_size_160 = ('1'..'159').to_a
    test_size_500 = ('1'..'500').to_a
    test_size_1000 = ('1'..'1000').to_a


    assert_equal 30, @encoder.determine_row_size(split_braille)
    assert_equal 39, @encoder.determine_row_size(test_size_160)
    assert_equal 38, @encoder.determine_row_size(test_size_500)
    assert_equal 40, @encoder.determine_row_size(test_size_1000)
  end

  def test_collect_one_third_of_each_char
    split_braille = ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.", "0.", ".0", "0.", ".0", "00", ".0", "0.", ".0", "0.", "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."]

    assert_equal "0.0.0.0.0..00.0.0.00", @encoder.collect_first_one_third_of_each_char(split_braille, 100).delete("\n")
    assert_equal "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0", @encoder.collect_second_one_third_of_each_char(split_braille, 100).delete("\n")
    assert_equal "0.0.0.0.0..00.0.0.0000.00.0..000.0000..0....0.0.0..00.0.0...", @encoder.collect_third_one_third_of_each_char(split_braille, 100).delete("\n")
  end
end
