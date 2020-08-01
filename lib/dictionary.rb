class Dictionary
  attr_reader :to_braille_conversion,
              :to_english_conversion

  def initialize()
    @to_braille_conversion = Hash.new
    character_to_braille_key
    @to_english_conversion = @to_braille_conversion.invert
  end

  def character_to_braille_key
    @to_braille_conversion[" "] = "..|..|..|"
    @to_braille_conversion["a"] = "0.|..|..|"
    @to_braille_conversion["b"] = "0.|0.|..|"
    @to_braille_conversion["c"] = "00|..|..|"
    @to_braille_conversion["d"] = "00|.0|..|"
    @to_braille_conversion["e"] = "0.|.0|..|"
    @to_braille_conversion["f"] = "00|0.|..|"
    @to_braille_conversion["g"] = "00|0.|..|"
    @to_braille_conversion["h"] = "0.|00|..|"
    @to_braille_conversion["i"] = ".0|0.|..|"
    @to_braille_conversion["j"] = ".0|00|..|"#234
    @to_braille_conversion["k"] = "0.|..|0.|"#15
    @to_braille_conversion["l"] = "0.|0.|0.|"#135
    @to_braille_conversion["m"] = "00|..|0.|"#125
    @to_braille_conversion["n"] = "00|.0|0.|"#1245
    @to_braille_conversion["o"] = "0.|.0|0.|"#145
    @to_braille_conversion["p"] = "00|0.|0.|"#1235
    @to_braille_conversion["q"] = "00|00|0.|"#12345
    @to_braille_conversion["r"] = "0.|00|0.|"#1345
    @to_braille_conversion["s"] = ".0|0.|0.|"#235
    @to_braille_conversion["t"] = ".0|00|0.|"#2345
    @to_braille_conversion["u"] = "0.|..|00|"#156
    @to_braille_conversion["v"] = "0.|0.|00|"#1356
    @to_braille_conversion["w"] = ".0|00|.0|"#2346
    @to_braille_conversion["x"] = "00|..|00|"#1256
    @to_braille_conversion["y"] = "00|.0|00|"#12456
    @to_braille_conversion["z"] = "0.|.0|00|"#1456
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
