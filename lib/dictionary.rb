class Dictionary
  attr_reader :to_braille_conversion,
              :to_english_conversion

  def initialize()
    @to_braille_conversion = Hash.new
    character_to_braille_key
    @to_english_conversion = @to_braille_conversion.invert
  end

  def character_to_braille_key
    @to_braille_conversion[" "] = "......"
    @to_braille_conversion["a"] = "0....."
    @to_braille_conversion["b"] = "0.0..."
    @to_braille_conversion["c"] = "00...."
    @to_braille_conversion["d"] = "00.0.."
    @to_braille_conversion["e"] = "0..0.."
    @to_braille_conversion["f"] = "000..."
    @to_braille_conversion["g"] = "0000.."
    @to_braille_conversion["h"] = "0.00.."
    @to_braille_conversion["i"] = ".00..."
    @to_braille_conversion["j"] = ".000.."
    @to_braille_conversion["k"] = "0...0."
    @to_braille_conversion["l"] = "0.0.0."
    @to_braille_conversion["m"] = "00..0."
    @to_braille_conversion["n"] = "00.00."
    @to_braille_conversion["o"] = "0..00."
    @to_braille_conversion["p"] = "000.0."
    @to_braille_conversion["q"] = "00000."
    @to_braille_conversion["r"] = "0.000."
    @to_braille_conversion["s"] = ".00.0."
    @to_braille_conversion["t"] = ".0000."
    @to_braille_conversion["u"] = "0...00"
    @to_braille_conversion["v"] = "0.0.00"
    @to_braille_conversion["w"] = ".000.0"
    @to_braille_conversion["x"] = "00..00"
    @to_braille_conversion["y"] = "00.000"
    @to_braille_conversion["z"] = "0..000"
  end
end
