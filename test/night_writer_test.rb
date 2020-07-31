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
end
