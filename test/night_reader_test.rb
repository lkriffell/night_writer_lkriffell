require "minitest/autorun"
require "minitest/pride"
require "./lib/night_reader"

class NightReaderTest < Minitest::Test

  def setup
    @night_reader = NightReader.new
  end

  def test_it_exists
    assert_instance_of NightReader, @night_reader
  end

  def test_it_has_attributes
    assert_instance_of FileReader, @night_reader.reader
    assert_instance_of FileWriter, @night_reader.writer
    assert_instance_of Dictionary, @night_reader.dictionary
  end

end
