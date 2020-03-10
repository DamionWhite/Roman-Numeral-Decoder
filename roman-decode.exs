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

defmodule Solution do
  def decode(list, romanNums \\ [])
  def decode([head | tail], romanNums) when head in [73, 86, 88, 76, 67, 68, 77] do
    IO.puts("Uppercase Roman Numeral: #{[head]}")
    decode(tail, romanNums ++ [head])
  end

  def decode([head | tail], romanNums) when head in [105, 118, 120, 108, 99, 100, 109] do
    IO.puts("Lowercase Roman Numeral: #{[head]}")
    decode(tail, romanNums ++ [head - 32])
  end

  def decode([head | _tail], _romanNums) do
    IO.puts("Illegal character: #{[head]}")
  end

  def decode([], romanNums) do
    romanNums
  end
end
