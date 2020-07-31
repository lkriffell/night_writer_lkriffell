class Dictionary
  attr_reader :to_braille_conversion

  def initialize()
    @to_braille_conversion = Hash.new
    encode_to_braille
  end

  def encode_to_braille
    @to_braille_conversion["a"] = "o.\n..\n..\n"
    @to_braille_conversion["b"] = "o.\no.\n..\n"
    @to_braille_conversion["c"] = "oo\n..\n..\n"
    @to_braille_conversion["d"] = "oo\n.o\n..\n"
    @to_braille_conversion["e"] = "o.\n.o\n..\n"
    @to_braille_conversion["f"] = "oo\no.\n..\n"
    @to_braille_conversion["g"] = "oo\no.\n..\n"
    @to_braille_conversion["h"] = "o.\noo\n..\n"
    @to_braille_conversion["i"] = ".o\no.\n..\n"
    @to_braille_conversion["j"] = ".o\noo\n..\n"#234
    @to_braille_conversion["k"] = "o.\n..\n5.\n"#15
    @to_braille_conversion["l"] = "o.\no.\no.\n"#135
    @to_braille_conversion["m"] = "oo\n..\no.\n"#125
    @to_braille_conversion["n"] = "oo\n.o\no.\n"#1245
    @to_braille_conversion["o"] = "o.\n.o\no.\n"#145
    @to_braille_conversion["p"] = "oo\no.\no.\n"#1235
    @to_braille_conversion["q"] = "oo\noo\no.\n"#12345
    @to_braille_conversion["r"] = "o.\noo\no.\n"#1345
    @to_braille_conversion["s"] = ".o\no.\no.\n"#235
    @to_braille_conversion["t"] = ".o\noo\no.\n"#2345
    @to_braille_conversion["u"] = "o.\n..\noo\n"#156
    @to_braille_conversion["v"] = "o.\no.\noo\n"#1356
    @to_braille_conversion["w"] = ".o\noo\n.o\n"#2346
    @to_braille_conversion["x"] = "oo\n..\noo\n"#1256
    @to_braille_conversion["y"] = "oo\n.o\noo\n"#12456
    @to_braille_conversion["z"] = "o.\n.o\noo\n"#1456
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
