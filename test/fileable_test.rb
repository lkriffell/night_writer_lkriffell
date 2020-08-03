require "./test/test_helper"

class FileableTest < Minitest::Test
  include Fileable

  def test_read_and_write
    write("this is a test to see if the read and write methods work", "message.txt")
    expected = "this is a test to see if the read and write methods work"

    assert_equal expected, read("message.txt")
  end
end
