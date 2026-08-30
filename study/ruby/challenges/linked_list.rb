# Write a simple linked list implementation. The linked list is a fundamental
# data structure in computer science, often used in the implementation of other
# data structures.

# The simplest kind of linked list is a singly linked list. Each element in the
# list contains data and a "next" field pointing to the next element in the list
# of elements. This variant of linked lists is often used to represent sequences
# or push-down stacks (also called a LIFO stack; Last In, First Out).

# Let's create a singly linked list whose elements may contain a range of data
# such as the numbers 1-10. Provide methods to reverse the linked list and
# convert a linked list to and from an array.

require 'minitest/autorun'

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(val, node = nil)
    @datum = val
    @next = node ? node : nil
  end

  def tail?()
    @next == nil
  end
end

class SimpleLinkedList
  attr_accessor :size, :head

  def initialize()
    @size = 0
    @head = nil
  end

  def empty?()
    size == 0
  end

  def push(val)
    node = Element.new(val)
    node.next = head if head
    self.head = node
    self.size += 1
  end

  def peek()
    head ? head.datum : nil
  end

  def pop()
    if size == 0
      return nil
    end

    next_node = head.next
    popped_node = head
    self.head = next_node
    self.size -= 1

    popped_node.datum
  end

  def self.from_a(arr)
    list = self.new

    return list if !arr.instance_of?(Array)

    arr.reverse.each do |val|
      list.push(val)
    end

    list
  end

  def to_a()
    curr = head
    arr = []

    while curr
      arr.push(curr.datum)
      curr = curr.next
    end

    arr
  end

  def reverse()
    arr = to_a
    self.class.from_a(arr.reverse)
  end
end



class LinkedListTest < Minitest::Test
  def test_element_datum
    element = Element.new(1)
    assert_equal 1, element.datum
  end

  def test_element_tail
    element = Element.new(1)
    assert element.tail?
  end

  def test_element_next_default
    element = Element.new(1)
    assert_nil element.next
  end

  def test_element_next_initialization
    element1 = Element.new(1)
    element2 = Element.new(2, element1)
    assert_equal element1, element2.next
  end

  def test_empty_list_size
    list = SimpleLinkedList.new
    assert_equal 0, list.size
  end

  def test_empty_list_empty
    list = SimpleLinkedList.new
    assert list.empty?
  end

  def test_pushing_element_on_list
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.size
  end

  def test_empty_list_1_element
    list = SimpleLinkedList.new
    list.push(1)
    refute list.empty?
  end

  def test_peeking_at_list
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.size
    assert_equal 1, list.peek
  end

  def test_peeking_at_empty_list
    list = SimpleLinkedList.new
    assert_nil list.peek
  end

  def test_access_head_element
    list = SimpleLinkedList.new
    list.push(1)
    assert_instance_of Element, list.head
    assert_equal 1, list.head.datum
    assert list.head.tail?
  end

  def test_items_are_stacked
    list = SimpleLinkedList.new
    list.push(1)
    list.push(2)
    assert_equal 2, list.size
    assert_equal 2, list.head.datum
    assert_equal 1, list.head.next.datum
  end

  def test_push_10_items
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    assert_equal 10, list.size
    assert_equal 10, list.peek
  end

  def test_pop_1_item
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.pop
    assert_equal 0, list.size
  end

  def test_popping_frenzy
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    6.times { list.pop }
    assert_equal 4, list.size
    assert_equal 4, list.peek
  end

  def test_from_a_empty_array
    list = SimpleLinkedList.from_a([])
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_nil
    list = SimpleLinkedList.from_a(nil)
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_2_element_array
    list = SimpleLinkedList.from_a([1, 2])
    assert_equal 2, list.size
    assert_equal 1, list.peek
    assert_equal 2, list.head.next.datum
  end

  def test_from_a_10_items
    list = SimpleLinkedList.from_a((1..10).to_a)
    assert_equal 10, list.size
    assert_equal 1, list.peek
    assert_equal 10, list.head.next.next.next.next.next.next.next.next.next.datum
  end

  def test_to_a_empty_list
    list = SimpleLinkedList.new
    assert_equal [], list.to_a
  end

  def test_to_a_of_1_element_list
    list = SimpleLinkedList.from_a([1])
    assert_equal [1], list.to_a
    assert_equal 1, list.size
    assert_equal 1, list.peek
  end

  def test_to_a_of_2_element_list
    list = SimpleLinkedList.from_a([1, 2])
    assert_equal [1, 2], list.to_a
    assert_equal 2, list.size
    assert_equal 1, list.head.datum
    assert_equal 2, list.head.next.datum
  end

  def test_reverse_2_element_list
    list = SimpleLinkedList.from_a([1, 2])
    # list_r and list need not be the same object
    list_r = list.reverse

    assert_equal 2, list_r.peek
    assert_equal 1, list_r.head.next.datum
    assert list_r.head.next.tail?
  end

  def test_reverse_10_element_list
    data = (1..10).to_a
    list = SimpleLinkedList.from_a(data)
    assert_equal data.reverse, list.reverse.to_a
  end

  def test_roundtrip_10_element_array
    data = (1..10).to_a
    assert_equal data, SimpleLinkedList.from_a(data).to_a
  end
end