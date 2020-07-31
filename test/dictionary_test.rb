require "./lib/dictionary"
require "minitest/autorun"
require "minitest/pride"

class DictionaryTest < Minitest::Test

  def test_it_exists
    dictionary = Dictionary.new
    assert_instance_of Dictionary, dictionary
  end

  def test_it_has_attributes
    dictionary = Dictionary.new
    dictionary.encode_to_braille
    # to_braille_conversion is split for testing purposes
    assert_equal ["oo", "..", "o."], dictionary.to_braille_conversion['m'].split("\n")
  end

end
