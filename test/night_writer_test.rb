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
end
