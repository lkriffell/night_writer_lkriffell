require "./test/test_helper"

class DictionaryTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    
    assert_instance_of Dictionary, dictionary
  end

  def test_it_has_attributes
    dictionary = Dictionary.new

    assert_equal "00..0.", dictionary.to_braille_conversion["m"]
  end

  def test_to_english_conversion
    dictionary = Dictionary.new

    assert_equal "b", dictionary.to_english_conversion["0.0..."]
  end

end
