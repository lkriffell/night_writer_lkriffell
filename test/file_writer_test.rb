require "minitest/autorun"
require "minitest/pride"
require "./lib/file_writer"

class FileWriterTest < Minitest::Test

  def test_it_exists
    writer = FileWriter.new
    
    assert_instance_of FileWriter, writer
  end

  #def test_it_has_attributes
  #end

end
