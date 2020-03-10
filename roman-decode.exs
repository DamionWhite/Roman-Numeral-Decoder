# charcode 97 - 122 lowercase
# charcode 65 - 90 UPPERCASE
# 32 difference lower/UPPER

# | ROMAN | upper | lower |
# +-=====================-+
# |   I   |  73   |  105  |
# |   V   |  86   |  118  |
# |   X   |  88   |  120  |
# |   L   |  76   |  108  |
# |   C   |  67   |   99  |
# |   D   |  68   |  100  |
# |   M   |  77   |  109  |


# Takes a Roman Numeral and returns it as a integer
# Examples: 'I' -> 1, 'XV' -> 15, 'MDCLXVI' -> 1666 
defmodule Solution do

  # Decode first filters the input
  def decode(romanNumeral, romanNums \\ [])
  # Only valid Roman Numerals pass
  def decode([head | tail], romanNums) when head in [73, 86, 88, 76, 67, 68, 77] do
    IO.puts("Uppercase Roman Numeral: #{[head]}")
    decode(tail, romanNums ++ [head])
  end
  # Lowercased Roman Numerals get capitalized
  def decode([head | tail], romanNums) when head in [105, 118, 120, 108, 99, 100, 109] do
    IO.puts("Lowercase Roman Numeral: #{[head]}")
    decode(tail, romanNums ++ [head - 32])
  end
  # Catch any illegal character
  def decode([head | _tail], _romanNums) do
    IO.puts("Illegal character: #{[head]}")
  end
  def decode([], romanNums) do
    romanToNum(romanNums)
  end

  # Reduce a charlist of valid roman numerals to decimal integers
  defp romanToNum(romanNums, nums \\ [])
  defp romanToNum([head | tail], nums) do
    case head do
      73 -> # I
        romanToNum(tail, nums ++ [1])
      86 -> # V
        romanToNum(tail, nums ++ [5])
      88 -> # X
        romanToNum(tail, nums ++ [10])
      76 -> # L
        romanToNum(tail, nums ++ [50])
      67 -> # C
        romanToNum(tail, nums ++ [100])
      68 -> # D
        romanToNum(tail, nums ++ [500])
      77 -> # M
        romanToNum(tail, nums ++ [1000])        
    end
  end

  defp romanToNum([], nums) do
    nums
  end

end
