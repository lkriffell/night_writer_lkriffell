module Fileable

  def write(translation, filename)
    File.open(filename, "w") { |file| file.write "#{translation}"}
  end

  def read(filename)
    File.read(filename)
  end

end
