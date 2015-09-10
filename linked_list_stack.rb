class LinkedListStack
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(node)
    @head = LinkedListNode.new(node.value, @head)
  end
end