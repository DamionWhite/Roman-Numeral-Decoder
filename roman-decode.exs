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
  def decode([head | tail] ) when head in [73, 86, 88, 76, 67, 68, 77] do
    IO.puts("starts with uppercase Roman Numeral")
  end

  def decode([head | tail]) when head in [105, 118, 120, 108, 99, 100, 109] do
    IO.puts("starts with lowercase Roman Numeral")
  end

  def decode([head | tail]) do
    IO.puts("Doesn't start with a Roman Numeral")
  end
end
