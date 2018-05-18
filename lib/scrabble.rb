require 'pry'
class Scrabble

  def score(word)
    return 0 if word.nil?
    score = calculate_points(word)
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def format_word(word)
    word.upcase.chars
  end

  def calculate_points(word)
    format_word(word).map do |letter|
      point_values[letter]
    end.sum
  end

  def score_with_multipliers(word, letter_mult, word_mult = 1)
    score = format_word(word).map.with_index do |letter, index|
      point_values[letter] * letter_mult[index]
    end.sum
    score * word_mult
  end
end
