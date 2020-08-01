require "./test/test_helper"
# require "./lib/dictionary"
# require "minitest/autorun"
# require "minitest/pride"

class DictionaryTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_it_has_attributes
    dictionary = Dictionary.new
    dictionary.character_to_braille_key

    assert_equal "00..0.", dictionary.to_braille_conversion["m"]
  end

  def test_to_english_conversion
    dictionary = Dictionary.new
    dictionary.character_to_braille_key

    assert_equal "b", dictionary.to_english_conversion["0.0..."]
  end

end
