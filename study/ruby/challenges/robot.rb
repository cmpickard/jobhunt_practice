=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you
boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which
means that their name gets wiped. The next time you ask, it will respond with
a new random name.

The names must be random; they should not follow a predictable sequence.
Random names means there is a risk of collisions. Your solution should not
allow the use of the same name twice.
=end

class Robot
  NAMES = ['']

  def initialize()
    @name = gen_name()
  end

  def reset()
    @name = gen_name()
  end

  def name()
    return @name
  end

  private

  def new_num() 
    ('0'..'9').to_a.sample
  end

  def new_letter()
    ('A'..'Z').to_a.sample
  end

  def gen_name()
    new_name = ''

    while NAMES.include?(new_name)
      new_name = new_letter() + new_letter() + new_num() + new_num() + new_num()
    end

    NAMES.push(new_name)
    @name = new_name
  end
end

require 'minitest/autorun'

class RobotTest < Minitest::Test
  DIFFERENT_ROBOT_NAME_SEED = 1234
  SAME_INITIAL_ROBOT_NAME_SEED = 1000

  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def test_has_name
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    refute_equal name, name2
    assert_match NAME_REGEXP, name2
  end

  def test_different_name_when_chosen_name_is_taken
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name1 = Robot.new.name
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name2 = Robot.new.name
    refute_equal name1, name2
  end
end