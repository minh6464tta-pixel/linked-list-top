require_relative 'lib/linked_list'

example = LinkedList.new

example.append(1)
example.prepend(0)
example.append(2)

puts example

puts example.insert_at(3, -1, -2)

puts example

example.remove_at(4)

puts example
