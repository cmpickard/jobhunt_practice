=begin
Write some code that converts modern decimal numbers into their Roman number
equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for
hundreds of years. They invented concrete and straight roads and even bikinis.
One thing they never discovered though was the number zero. This made writing
and dating extensive histories of their exploits slightly more challenging, but
the system of numbers they came up with is still in use today. For example the
BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these
letters have lots of straight lines and are hence easy to hack into stone
tablets.

Copy Code
 1  => I
10  => X
 7  => VII
 
There is no need to be able to convert numbers larger than about 3000.
(The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit
separately starting with the left most digit and skipping any digit with a
value of zero.

To see this in practice, consider the example of 1990. In Roman numerals,
1990 is MCMXC:

Copy Code
1000=M
900=CM
90=XC
2008 is written as MMVIII:

Copy Code
2000=MM
8=VIII

MCMXCVI

go right to left:
if next char has larger or equal value, STOP
add current char val to total

else, 
subtract next char val from current char value,
then add result to total

MCMXCVI

I - 1
V - larger, so total = 1

V - 5
C - larger, so total = 1 + 5

C - 100
X - smaller, so total = 6 + (100 - 10)

=end
require 'minitest/autorun'
require_relative 'roman_numerals'

class RomanNumeral
  # CHAR_TO_NUM = { 'I': 1, 'V': 5, 'X': 10, 'L': 50,
  #                 'C': 100, 'D': 500, 'M': 1000, '': 0}

  def initialize(int)
    @int = int
  end

  def to_roman()
    roman = ''
    remainder = @int

    while remainder >= 1000
      roman += 'M'
      remainder -= 1000
    end

    if remainder >= 900
      roman += 'CM'
      remainder -= 900
    end

    if remainder >= 500
      roman += 'D'
      remainder -= 500
    end

    if remainder >= 400
      roman += 'CD'
      remainder -= 400
    end
    
    while remainder >= 100
      roman += 'C'
      remainder -= 100
    end
    
    if remainder >= 900
      roman += 'CM'
      remainder -= 900
    end
    
    if remainder >= 500
      roman += 'D'
      remainder -= 500
    end
    
    if remainder >= 400
      roman += 'CD'
      remainder -= 400
    end
    
    while remainder >= 100
      roman += 'C'
      remainder -= 100
    end
    
    if remainder >= 90
      roman += 'XC'
      remainder -= 90
    end
    
    if remainder >= 50
      roman += 'L'
      remainder -= 50
    end
    
    if remainder >= 40
      roman += 'XL'
      remainder -= 40
    end
    
    while remainder >= 10
      roman += 'X'
      remainder -= 10
    end
    
    if remainder >= 9
      roman += 'IX'
      remainder -= 9
    end
    
    if remainder >= 5
      roman += 'V'
      remainder -= 5
    end
    
    if remainder >= 4
      roman += 'IV'
      remainder -= 4
    end
    
    while remainder >= 1
      roman += 'I'
      remainder -= 1
    end

    roman
  end

  # def to_numeral()
  #   total = 0

  #   @numeral.reverse.each_with_index do |char, idx|
  #     char_val = CHAR_TO_NUM[char.to_sym]
  #     prev_char = @numeral[idx - 1] || ''
  #     prev_char_val = CHAR_TO_NUM[next_char]
  #     total += (prev_char_val > char_val) ? (-1 * char_val) : char_val
  #   end

  #   total
  # end
end

class RomanNumeralsTest < Minitest::Test
  def test_1
    number = RomanNumeral.new(1)
    assert_equal 'I', number.to_roman
  end

  def test_2
    
    number = RomanNumeral.new(2)
    assert_equal 'II', number.to_roman
  end

  def test_3
    
    number = RomanNumeral.new(3)
    assert_equal 'III', number.to_roman
  end

  def test_4
    
    number = RomanNumeral.new(4)
    assert_equal 'IV', number.to_roman
  end

  def test_5
    
    number = RomanNumeral.new(5)
    assert_equal 'V', number.to_roman
  end

  def test_6
    
    number = RomanNumeral.new(6)
    assert_equal 'VI', number.to_roman
  end

  def test_9
    
    number = RomanNumeral.new(9)
    assert_equal 'IX', number.to_roman
  end

  def test_27
    
    number = RomanNumeral.new(27)
    assert_equal 'XXVII', number.to_roman
  end

  def test_48
    
    number = RomanNumeral.new(48)
    assert_equal 'XLVIII', number.to_roman
  end

  def test_59
    
    number = RomanNumeral.new(59)
    assert_equal 'LIX', number.to_roman
  end

  def test_93
    
    number = RomanNumeral.new(93)
    assert_equal 'XCIII', number.to_roman
  end

  def test_141
    
    number = RomanNumeral.new(141)
    assert_equal 'CXLI', number.to_roman
  end

  def test_163
    
    number = RomanNumeral.new(163)
    assert_equal 'CLXIII', number.to_roman
  end

  def test_402
    
    number = RomanNumeral.new(402)
    assert_equal 'CDII', number.to_roman
  end

  def test_575
    
    number = RomanNumeral.new(575)
    assert_equal 'DLXXV', number.to_roman
  end

  def test_911
    
    number = RomanNumeral.new(911)
    assert_equal 'CMXI', number.to_roman
  end

  def test_1024
    
    number = RomanNumeral.new(1024)
    assert_equal 'MXXIV', number.to_roman
  end

  def test_3000
    
    number = RomanNumeral.new(3000)
    assert_equal 'MMM', number.to_roman
  end
end
