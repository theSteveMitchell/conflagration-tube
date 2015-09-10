class LinkedList
  def initialize(head)
    @head = head
  end

  def to_s
    string = ""
    while @head
      string << "#{@head.value} --> "
      @head = @head.pointer
    end
    string << "nil"
  end

  def reverse
    # clone the head node so we don't modify in place
    iterator = @head.clone
    left_node = nil
    # iterate the nodes and reverse the direction of the pointer.
    while iterator
      # also clone each node as we iterate to avoid in-place modification.
      right_node = iterator.pointer.nil? ? nil : iterator.pointer.clone
      iterator.pointer = left_node
      left_node = iterator
      iterator = right_node
    end
    left_node
  end

end