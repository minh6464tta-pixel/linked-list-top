require_relative 'lib/linked_list'

example = LinkedList.new

example.append(1)
example.prepend(0)
example.append(2)

puts example

puts example.index(2)
