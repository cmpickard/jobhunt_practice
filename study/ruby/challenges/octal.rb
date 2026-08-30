=begin
Implement octal to decimal conversion. Given an octal input string, your
program should produce a decimal output. Treat invalid input as octal 0.
The only valid digits in an octal number are 0, 1, 2, 3, 4, 5, 6, and 7.

Note: Implement the conversion yourself. Don't use any built-in or library
methods that perform the necessary conversions for you. In this exercise,
the code necessary to perform the conversion is what we're looking for.

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be
understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.
Thus:

Copy Code
  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
Octal numbers are similar, but they use a base-8 system. A number 233 in base 8
can be understood as a linear combination of powers of 8:

The rightmost digit gets multiplied by 80 = 1
The next digit gets multiplied by 81 = 8
The digit after that gets multiplied by 82 = 64
The digit after that gets multiplied by 83 = 512
...
The n*th* digit gets multiplied by 8n-1.
All of these values are then summed.
Thus:

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155
=end

class Octal
  def initialize(num) 
    @num = num
  end

  def to_decimal
    return 0 if @num.to_i < 1 || /[^0-7]/.match?(@num)

    result = 0
    digit_arr = @num.chars
    place= digit_arr.length - 1

    while place > -1
      curr = digit_arr.shift
      result += (curr.to_i * (8 ** place)) 
      place -= 1
    end

    result
  end
end

require 'minitest/autorun'

class OctalTest < Minitest::Test
  def test_octal_1_is_decimal_1
    assert_equal 1, Octal.new('1').to_decimal
  end

  def test_octal_10_is_decimal_8
    assert_equal 8, Octal.new('10').to_decimal
  end

  def test_octal_17_is_decimal_15
    assert_equal 15, Octal.new('17').to_decimal
  end

  def test_octal_11_is_decimal_9
    assert_equal 9, Octal.new('11').to_decimal
  end

  def test_octal_130_is_decimal_88
    assert_equal 88, Octal.new('130').to_decimal
  end

  def test_octal_2047_is_decimal_1063
    assert_equal 1063, Octal.new('2047').to_decimal
  end

  def test_octal_7777_is_decimal_4095
    assert_equal 4095, Octal.new('7777').to_decimal
  end

  def test_octal_1234567_is_decimal_342391
    assert_equal 342_391, Octal.new('1234567').to_decimal
  end

  def test_invalid_octal_is_decimal_0
    assert_equal 0, Octal.new('carrot').to_decimal
  end

  def test_8_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('8').to_decimal
  end

  def test_9_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('9').to_decimal
  end

  def test_6789_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('6789').to_decimal
  end

  def test_abc1z_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('abc1z').to_decimal
  end

  def test_valid_octal_formatted_string_011_is_decimal_9
    assert_equal 9, Octal.new('011').to_decimal
  end

  def test_234abc_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('234abc').to_decimal
  end
end