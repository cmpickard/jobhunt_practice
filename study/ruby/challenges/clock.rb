=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time
represented by a given Clock object. Note that you should not mutate Clock
objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use
arithmetic operations.
=end

class Clock
  attr_reader :hour, :min

  def self.at(hour, min = 0)
    return new(hour, min)
  end

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def to_s()
    return format
  end

  def ==(other)
    @hour == other.hour && @min == other.min
  end

  def +(other)
    total_mins = @min + other

    while total_mins < 0
      total_mins += 60
      @hour = @hour == 0 ? 23 : @hour - 1
    end

    while total_mins > 59
      total_mins  -= 60
      @hour = @hour == 23 ? 0 : @hour + 1
    end

    self.class.new(@hour, total_mins)
  end

  def -(other)
    self + (-1 * other)
  end

  private
  
  def format()
    hour = @hour > 9 ? @hour.to_s : '0' + @hour.to_s
    mins = @min > 9 ? @min.to_s : '0' + @min.to_s

    hour + ':' + mins
  end
end

# clock1 = Clock.at(15, 37)
# p clock1
# clock2 = Clock.at(15, 36)
# p clock2
# p (clock1 == clock2)

require 'minitest/autorun'

class ClockTest < Minitest::Test
  def test_on_the_hour
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end

  def test_past_the_hour
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    clock = Clock.at(10) + 3
    assert_equal '10:03', clock.to_s
  end

  def test_adding_does_not_mutate
    old_clock = Clock.at(10)
    new_clock = old_clock + 3
    refute_same new_clock, old_clock
  end

  def test_subtract_fifty_minutes
    clock = Clock.at(0) - 50
    assert_equal '23:10', clock.to_s
  end

  def test_subtracting_does_not_mutate
    old_clock = Clock.at(10)
    new_clock = old_clock - 50
    refute_same new_clock, old_clock
  end

  def test_add_over_an_hour
    clock = Clock.at(10) + 61
    assert_equal '11:01', clock.to_s
  end

  def test_wrap_around_at_midnight
    clock = Clock.at(23, 30) + 60
    assert_equal '00:30', clock.to_s
  end

  def test_add_more_than_a_day
    clock = Clock.at(10) + 3061
    assert_equal '13:01', clock.to_s
  end

  def test_subtract_a_few_minutes
    clock = Clock.at(10, 30) - 5
    assert_equal '10:25', clock.to_s
  end

  def test_subtract_minutes
    clock = Clock.at(10) - 90
    assert_equal '08:30', clock.to_s
  end

  def test_wrap_around_at_negative_midnight
    clock = Clock.at(0, 30) - 60
    assert_equal '23:30', clock.to_s
  end

  def test_subtract_more_than_a_day
    clock = Clock.at(10) - 3061
    assert_equal '06:59', clock.to_s
  end

  def test_equivalent_clocks
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_inequivalent_clocks
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 36)
    clock3 = Clock.at(14, 37)
    refute_equal clock1, clock2
    refute_equal clock1, clock3
  end

  def test_wrap_around_backwards
    clock1 = Clock.at(0, 30) - 60
    clock2 = Clock.at(23, 30)
    assert_equal clock1, clock2
  end
end