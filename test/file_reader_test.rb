require "minitest/autorun"
require "minitest/pride"
require "./lib/file_reader"

class FilereaderTest < Minitest::Test

  def setup
    @reader = FileReader.new
  end

  def test_it_exists
    assert_instance_of FileReader, @reader
  end
  
end
