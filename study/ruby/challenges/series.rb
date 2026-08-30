# Write a program that will take a string of digits and return all the possible
# consecutive number series of a specified length in that string.

# For example, the string "01234" has the following 3-digit series:

# 012
# 123
# 234
# Likewise, here are the 4-digit series:

# 0123
# 1234
# Finally, if you ask for a 6-digit series from a 5-digit string, you should
# throw an error.

class Series
  def initialize(str) 
    @series = str
  end

  def slices(size)
    raise ArgumentError if size > @series.length

    slices = @series.length - (size - 1)
    (0...slices).map do |idx|
      @series.slice(idx, size).chars.map(&:to_i)
    end
  end
end

require 'minitest/autorun'

class SeriesTest < Minitest::Test
  def test_simple_slices_of_one
    series = Series.new('01234')
    assert_equal [[0], [1], [2], [3], [4]], series.slices(1)
  end

  def test_simple_slices_of_one_again
    series = Series.new('92834')
    assert_equal [[9], [2], [8], [3], [4]], series.slices(1)
  end

  def test_simple_slices_of_two
    series = Series.new('01234')
    assert_equal [[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2)
  end

  def test_other_slices_of_two
    series = Series.new('98273463')
    expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
    assert_equal expected, series.slices(2)
  end

  def test_simple_slices_of_two_again
    series = Series.new('37103')
    assert_equal [[3, 7], [7, 1], [1, 0], [0, 3]], series.slices(2)
  end

  def test_simple_slices_of_three
    series = Series.new('01234')
    assert_equal [[0, 1, 2], [1, 2, 3], [2, 3, 4]], series.slices(3)
  end

  def test_simple_slices_of_three_again
    series = Series.new('31001')
    assert_equal [[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3)
  end

  def test_other_slices_of_three
    series = Series.new('982347')
    expected = [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
    assert_equal expected, series.slices(3)
  end

  def test_simple_slices_of_four
    series = Series.new('01234')
    assert_equal [[0, 1, 2, 3], [1, 2, 3, 4]], series.slices(4)
  end

  def test_simple_slices_of_four_again
    series = Series.new('91274')
    assert_equal [[9, 1, 2, 7], [1, 2, 7, 4]], series.slices(4)
  end

  def test_simple_slices_of_five
    series = Series.new('01234')
    assert_equal [[0, 1, 2, 3, 4]], series.slices(5)
  end

  def test_simple_slices_of_five_again
    series = Series.new('81228')
    assert_equal [[8, 1, 2, 2, 8]], series.slices(5)
  end

  def test_simple_slice_that_blows_up
    series = Series.new('01234')
    assert_raises ArgumentError do
      series.slices(6)
    end
  end

  def test_more_complicated_slice_that_blows_up
    slice_string = '01032987583'

    series = Series.new(slice_string)
    assert_raises ArgumentError do
      series.slices(slice_string.length + 1)
    end
  end
end