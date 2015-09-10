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
    stack = LinkedListStack.new
    iterator = @head
    while iterator
      stack.push(iterator)
      iterator= iterator.pointer
    end

    return stack.head
  end

end