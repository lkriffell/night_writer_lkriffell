class Dictionary
  attr_reader :to_braille_conversion

  def initialize()
    @to_braille_conversion = Hash.new
    encode_to_braille
  end

  def encode_to_braille
    @to_braille_conversion[" "] = "..\n..\n..\n"
    @to_braille_conversion["a"] = "0.\n..\n..\n"
    @to_braille_conversion["b"] = "0.\n0.\n..\n"
    @to_braille_conversion["c"] = "00\n..\n..\n"
    @to_braille_conversion["d"] = "00\n.0\n..\n"
    @to_braille_conversion["e"] = "0.\n.0\n..\n"
    @to_braille_conversion["f"] = "00\n0.\n..\n"
    @to_braille_conversion["g"] = "00\n0.\n..\n"
    @to_braille_conversion["h"] = "0.\n00\n..\n"
    @to_braille_conversion["i"] = ".0\n0.\n..\n"
    @to_braille_conversion["j"] = ".0\n00\n..\n"#234
    @to_braille_conversion["k"] = "0.\n..\n5.\n"#15
    @to_braille_conversion["l"] = "0.\n0.\n0.\n"#135
    @to_braille_conversion["m"] = "00\n..\n0.\n"#125
    @to_braille_conversion["n"] = "00\n.0\n0.\n"#1245
    @to_braille_conversion["o"] = "0.\n.0\n0.\n"#145
    @to_braille_conversion["p"] = "00\n0.\n0.\n"#1235
    @to_braille_conversion["q"] = "00\n00\n0.\n"#12345
    @to_braille_conversion["r"] = "0.\n00\n0.\n"#1345
    @to_braille_conversion["s"] = ".0\n0.\n0.\n"#235
    @to_braille_conversion["t"] = ".0\n00\n0.\n"#2345
    @to_braille_conversion["u"] = "0.\n..\n00\n"#156
    @to_braille_conversion["v"] = "0.\n0.\n00\n"#1356
    @to_braille_conversion["w"] = ".0\n00\n.0\n"#2346
    @to_braille_conversion["x"] = "00\n..\n00\n"#1256
    @to_braille_conversion["y"] = "00\n.0\n00\n"#12456
    @to_braille_conversion["z"] = "0.\n.0\n00\n"#1456
    # @to_braille_conversion["0"] = "o.\n.o\noo\n"#234
    # @to_braille_conversion["1"] = "o.\n.o\noo\n"#1
    # @to_braille_conversion["2"] = "o.\n.o\noo\n"#13
    # @to_braille_conversion["3"] = "o.\n.o\noo\n"#12
    # @to_braille_conversion["4"] = "o.\n.o\noo\n"#124
    # @to_braille_conversion["5"] = "o.\n.o\noo\n"#14
    # @to_braille_conversion["6"] = "o.\n.o\noo\n"#123
    # @to_braille_conversion["7"] = "o.\n.o\noo\n"#1234
    # @to_braille_conversion["8"] = "o.\n.o\noo\n"#134
    # @to_braille_conversion["9"] = "o.\n.o\noo\n"#23
  end
end
