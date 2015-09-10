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

    while @head
      stack.push(@head)
      @head = @head.pointer
    end

    return stack.head
  end

end