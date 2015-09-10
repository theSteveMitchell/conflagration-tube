require "rubygems"
begin
  gem "test-unit"
rescue LoadError
  system("gem install test-unit")
  Gem.clear_paths
end
require "test/unit"
Dir[File.expand_path("../../linked_list*.rb", __FILE__)].each { |f| require f }

class LinkedListTest < Test::Unit::TestCase
  def setup
    @node1 = LinkedListNode.new(37)
    @node2 = LinkedListNode.new(99, @node1)
    @node3 = LinkedListNode.new(12, @node2)
    @list = LinkedList.new(@node3)
  end
  
  def test_to_s
    assert_equal('12 --> 99 --> 37 --> nil', @list.to_s)
  end

  def test_reverse
    revlist = @list.reverse
    assert_equal(37, revlist.value)
    assert_equal(99, revlist.pointer.value)
    assert_equal(12, revlist.pointer.pointer.value)
  end

  def test_no_inplace_update
    revlist = @list.reverse
    assert_equal('12 --> 99 --> 37 --> nil', @list.to_s)
  end

  def test_no_cycle_detected
    assert_equal(false, @list.has_cycle?)
  end

  def test_cycle_detected
    @node1.pointer = @node3
    assert_equal(true, @list.has_cycle?)
  end

  def test_assymetric_cycle_detected
    # Cycle does not include the full length of the list
    @node1.pointer = @node2
    assert_equal(true, @list.has_cycle?)
  end

  def test_no_cycle_detected_when_values_duplicated
    # list includes duplicated value, but no loop
    @node1.pointer = nil
    @node3.value = 37
    assert_equal(false, @list.has_cycle?)
  end


end
