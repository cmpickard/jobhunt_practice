# Create a custom set type.

# Sometimes it is necessary to define a custom data structure of some type, like
# a set. In this exercise you will define your own set type. How it works
# internally doesn't matter, as long as it behaves like a set of unique elements
# that can be manipulated in several well defined ways.

# In some languages, including Ruby and JavaScript, there is a built-in Set type
# For this problem, you're expected to implement your own custom set type. Once
# you've reached a solution, feel free to play around with using the built-in
# implementation of Set.

# For simplicity, you may assume that all elements of a set must be numbers.

require 'minitest/autorun'

class CustomSet
  attr_accessor :vals

  def initialize(arr = [])
    @vals = arr.uniq
  end

  def empty?()
    vals.size == 0
  end

  def contains?(val)
    vals.include?(val)
  end

  def subset?(other)
    for val in vals
      return false unless other.vals.include?(val)
    end

    true
  end

  def disjoint?(other)
    for val in other.vals
      return false if vals.include?(val)
    end

    true
  end

  def eql?(other = [])
    other = self.class.new(other) if other.instance_of?(Array)

    for val in other.vals
      return false unless vals.include?(val)
    end

    for val in vals
      return false unless other.vals.include?(val)
    end

    true
  end

  def ==(other)
    self.eql?(other)
  end

  def add(val)
    vals.push(val) unless vals.include?(val)
  end

  def intersection(other)
    result = []

    for val in vals
      result.push(val) if other.vals.include?(val)
    end

    result
  end

  def difference(other)
    result = []

    for val in vals
      result.push(val) unless other.vals.include?(val)
    end

    for val in other.vals
      result.push(val) unless vals.include?(val)
    end

    result
  end

  def union(other)
    result = other.clone

    for val in vals
      result.push(val) unless result.include?(val)
    end

    result
  end
end

class CustomSetTest < Minitest::Test
  def test_empty
    assert_equal true, CustomSet.new.empty?
  end

  def test_not_empty
    set = CustomSet.new([1])
    assert_equal false, set.empty?
  end

  def test_empty_does_not_contain

    set = CustomSet.new
    assert_equal false, set.contains?(1)
  end

  def test_does_contain

    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.contains?(1)
  end

  def test_set_does_not_contain

    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.contains?(4)
  end

  def test_subset_empty
    empty_set = CustomSet.new
    assert_equal true, empty_set.subset?(CustomSet.new)
  end

  def test_empty_is_subset_of_non_empty
    empty_set = CustomSet.new
    assert_equal true, empty_set.subset?(CustomSet.new([1]))
  end

  def test_non_empty_not_subset_of_empty
    set = CustomSet.new([1])
    assert_equal false, set.subset?(CustomSet.new)
  end

  def test_set_is_subset_of_same_set_of_elements
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.subset?(CustomSet.new([1, 2, 3]))
  end

  def test_set_is_subset_of_larger_set
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.subset?(CustomSet.new([4, 1, 2, 3]))
  end

  def test_not_subset_when_different_elements
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.subset?(CustomSet.new([4, 1, 3]))
  end

  def test_disjoint_empty_set
    empty_set = CustomSet.new
    assert_equal true, empty_set.disjoint?(CustomSet.new)
  end

  def test_disjoint_empty_and_non_empty
    empty_set = CustomSet.new
    assert_equal true, empty_set.disjoint?(CustomSet.new([1]))
  end

  def test_disjoint_non_empty_and_empty
    set = CustomSet.new([1])
    assert_equal true, set.disjoint?(CustomSet.new)
  end

  def test_disjoint_shared_element
    set = CustomSet.new([1, 2])
    assert_equal false, set.disjoint?(CustomSet.new([2, 3]))
  end

  def test_disjoint_no_shared_elements
    set = CustomSet.new([1, 2])
    assert_equal true, set.disjoint?(CustomSet.new([3, 4]))
  end

  def test_eql_empty
    empty_set = CustomSet.new
    assert_equal true, empty_set.eql?(CustomSet.new)
  end

  def test_eql_empty_and_non_empty
    empty_set = CustomSet.new
    assert_equal false, empty_set.eql?(CustomSet.new([1, 2, 3]))
  end

  def test_eql_non_empty_and_empty
    empty_set = CustomSet.new([1, 2, 3])
    assert_equal false, empty_set.eql?(CustomSet.new)
  end

  def test_eql_same_elements
    set = CustomSet.new([1, 2])
    assert_equal true, set.eql?(CustomSet.new([2, 1]))
  end

  def test_eql_different_elements
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.eql?(CustomSet.new([1, 2, 4]))
  end

  def test_eql_duplicate_elements_do_not_matter
    set = CustomSet.new([1, 2, 2, 1])
    assert_equal true, set.eql?(CustomSet.new([2, 1]))
  end

  def test_add_to_empty
    set = CustomSet.new
    set.add(3)
    assert_equal CustomSet.new([3]), set
  end

  def test_add_to_non_empty
    set = CustomSet.new([1, 2, 4]).add(3)
    expected = CustomSet.new([1, 2, 4, 3])
    assert_equal expected, set
  end

  def test_add_existing_element
    set = CustomSet.new([1, 2, 3]).add(3)
    expected = CustomSet.new([1, 2, 3])
    assert_equal expected, set
  end

  def test_intersection_empty
    skip
    set = CustomSet.new.intersection(CustomSet.new)
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_empty_and_non_empty
    skip
    set = CustomSet.new.intersection(CustomSet.new([3, 2, 5]))
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_non_empty_and_empty
    skip
    set = CustomSet.new([3, 2, 5]).intersection(CustomSet.new)
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_no_shared_elements
    skip
    first_set = CustomSet.new([1, 2, 3])
    second_set = CustomSet.new([4, 5, 6])
    actual = first_set.intersection(second_set)
    expected = CustomSet.new

    assert_equal expected, actual
  end

  def test_intersection_shared_elements
    skip
    first_set = CustomSet.new([1, 2, 3, 4])
    second_set = CustomSet.new([3, 2, 5])
    actual = first_set.intersection(second_set)
    expected = CustomSet.new([2, 3])

    assert_equal expected, actual
  end

  def test_difference_empty
    skip
    actual = CustomSet.new.difference(CustomSet.new)
    assert_equal CustomSet.new, actual
  end

  def test_difference_empty_and_non_empty
    skip
    actual = CustomSet.new.difference(CustomSet.new([3, 2, 5]))
    expected = CustomSet.new
    assert_equal expected, actual
  end

  def test_difference_non_empty_and_empty
    skip
    actual = CustomSet.new([1, 2, 3, 4]).difference(CustomSet.new)
    expected = CustomSet.new([1, 2, 3, 4])
    assert_equal expected, actual
  end

  def test_difference_non_empty_sets
    skip
    actual = CustomSet.new([3, 2, 1]).difference(CustomSet.new([2, 4]))
    expected = CustomSet.new([3, 1])
    assert_equal expected, actual
  end

  def test_union_empty
    skip
    actual = CustomSet.new.union(CustomSet.new)
    expected = CustomSet.new
    assert_equal expected, actual
  end

  def test_union_empty_and_non_empty
    skip
    actual = CustomSet.new.union(CustomSet.new([2]))
    expected = CustomSet.new([2])
    assert_equal expected, actual
  end

  def test_union_non_empty_and_empty
    skip
    actual = CustomSet.new([1, 3]).union(CustomSet.new)
    expected = CustomSet.new([1, 3])
    assert_equal expected, actual
  end

  def test_union_non_empty_sets
    skip
    actual = CustomSet.new([1, 3]).union(CustomSet.new([2, 3]))
    expected = CustomSet.new([1, 2, 3])
    assert_equal expected, actual
  end
end