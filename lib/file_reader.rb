class FileReader
  def read(filename)
    # filename = "message.txt"
    # commented for hard-coded testing
    # filename = ARGV[0]
    File.read(filename)
  end
end
