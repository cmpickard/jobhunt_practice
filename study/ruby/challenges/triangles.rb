=begin
# Write a program to determine whether a triangle is equilateral, isosceles,
# or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.
=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    valid?
  end

  def kind
    return 'scalene' if @sides.uniq.size == 3
    @sides.uniq.size == 1 ? 'equilateral' : 'isosceles'
  end

  private

  attr_reader :sides

  def valid()
    return ArgumentError unless sides[0] > 0 && (sides[0] + sides[1] > sides[2])
  end
end