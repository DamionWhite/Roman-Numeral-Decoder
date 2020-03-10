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
# Examples: 'I' -> 1, 'XIV' -> 14, 'MDCLXVI' -> 1666 
defmodule Solution do
  @uppercase_roman [73, 86, 88, 76, 67, 68, 77]
  @lowercase_roman [105, 118, 120, 108, 99, 100, 109]

  # Decode first filters the input
  def decode(roman_numeral, roman_nums \\ [])
  # Only valid Roman Numerals pass
  def decode([head | tail], roman_nums) when head in @uppercase_roman do
    IO.puts("Uppercase Roman Numeral: #{[head]}")
    decode(tail, roman_nums ++ [head])
  end
  # Lowercased Roman Numerals get capitalized
  def decode([head | tail], roman_nums) when head in @lowercase_roman do
    IO.puts("Lowercase Roman Numeral: #{[head]}")
    decode(tail, roman_nums ++ [to_uppercase(head)])
  end
  # Catch any illegal character
  def decode([head | _tail], _roman_nums) do
    IO.puts("Illegal character: #{[head]}")
  end
  def decode([], roman_nums) do
    roman_to_num(roman_nums)
  end

  # Reduce a charlist of valid roman numerals to decimal integers
  defp roman_to_num(roman_nums, nums \\ [])
  defp roman_to_num([head | tail], nums) do
    case head do
      73 -> # I
        roman_to_num(tail, nums ++ [1])
      86 -> # V
        roman_to_num(tail, nums ++ [5])
      88 -> # X
        roman_to_num(tail, nums ++ [10])
      76 -> # L
        roman_to_num(tail, nums ++ [50])
      67 -> # C
        roman_to_num(tail, nums ++ [100])
      68 -> # D
        roman_to_num(tail, nums ++ [500])
      77 -> # M
        roman_to_num(tail, nums ++ [1000])        
    end
  end
  # nums contains a integer representation for every roman numeral
  defp roman_to_num([], nums) do
    roman_squash(nums)
  end

  defp roman_squash(nums, result \\ 0)
  defp roman_squash([head, next | tail], result) do
    # if head < next; subtract head from next, and add to result
    if head < next do
      roman_squash(tail, result + next - head)
    # else just add head to result
    else
      roman_squash([next] ++ tail, result + head)
    end
    
  end

  defp roman_squash([head], result) do
    head + result
  end

  defp roman_squash([], result) do
    result
  end

  # subtracting 32 from a lowercased charcode will make it uppercased
  defp to_uppercase(char) do
    char - 32
  end
end
