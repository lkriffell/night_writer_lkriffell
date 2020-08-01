class FileWriter

  def write(translation, filename)
    # filename = "braille.txt"
    # commented for hard-coded testing
    # filename = ARGV[1]
    File.open(filename, "w") { |file| file.write "#{translation}"}
  end
end
