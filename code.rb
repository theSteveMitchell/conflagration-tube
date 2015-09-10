Dir[File.expand_path("../linked_list*.rb", __FILE__)].each { |f| require f }

def print_values(head)
  list = LinkedList.new(head)
  puts list.to_s
end

def reverse_list(head)
  list = LinkedList.new(head)
  list.reverse
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)