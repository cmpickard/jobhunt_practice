# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.
# Examples

# Diamond for letter 'A':

# Copy Code
# A
# Diamond for letter 'C':

# Copy Code
#   A
#  B B
# C   C
#  B B
#   A
# Diamond for letter 'E':

# Copy Code
#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A

=begin
dist_from_center * ' ' + letter + ((2 * dist from tip) - 1) * ' ' + letter

  rows = []
  ord = letter.ord
  distance = (2 * (letter.ord - 'A'.ord) - 1)

  while distance > -1
    rows.push(ord.chr + distance * ' ' + ord.chr)
    distance -= 2
    ord -= 1
  end

  rows.push('A')
  all_rows = rows.slice(1..-1).reverse + rows
  

=end
class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'

    rows = []
    ord = letter.ord
    distance = (2 * (letter.ord - 'A'.ord) - 1)
    outer = 0

    while distance > -1
      rows.push((' ' * outer) + ord.chr + (' ' * distance) + ord.chr + (' ' * outer) + "\n")
      outer += 1
      distance -= 2
      ord -= 1
    end

    rows.push(' ' * outer + 'A' + (' ' * outer) + "\n")
    all_rows = rows.slice(1..-1).reverse + rows
    all_rows.join('')
  end
end

Diamond.make_diamond('E')

require 'minitest/autorun'

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end