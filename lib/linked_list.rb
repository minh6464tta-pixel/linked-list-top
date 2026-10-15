require_relative 'node'

# Linked list
class LinkedList
  def initialize
    # do nothing
    @head = nil
    @tail = @head
    @count = 0
  end

  def append(value)
    new_node = Node.new
    new_node.value = value

    if @head.nil?
      @head = new_node
      @tail = @head
      @count += 1
      return
    end

    @tail.next_node = new_node
    @tail = new_node

    @count += 1
  end

  def prepend(value)
    new_node = Node.new
    new_node.value = value

    if @head.nil?
      @head = new_node
      @tail = @head
      @count += 1
      return
    end

    new_node.next_node = @head
    @head = new_node

    @count += 1
  end

  def size
    @count
  end

  def head
    return nil if @head.nil?

    @head.value
  end

  def tail
    return nil if @head.nil?

    @tail.value
  end

  def at(index)
    return nil unless index.between?(0, @count - 1)

    current_node = @head
    index.times do
      current_node = current_node.next_node
    end

    current_node.value
  end

  def pop
    return nil if @head.nil?

    current_node = @head
    @head = @head.next_node
    current_node.value
  end

  def contains?(value)
    return false if @head.nil?

    current_node = @head
    until current_node.equal?(@tail.next_node)
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def index(value)
    return false if @head.nil?

    current_node = @head
    count = 0

    until current_node.equal?(@tail.next_node)
      return count if current_node.value == value

      current_node = current_node.next_node
      count += 1
    end

    false
  end

  def insert_at(index, *values)
    return nil if index > @count

    first_node = Node.new(values[0])
    prev_node = first_node

    values[1..].each do |value|
      new_node = Node.new(value)
      prev_node.next_node = new_node
      prev_node = new_node
    end

    if index.zero?
      prev_node.next_node = node_at_index(0)
      @head = first_node
    elsif index == @count
      node_at_index(index - 1).next_node = first_node
      @tail = prev_node
    else
      before_node = node_at_index(index - 1)
      after_node = before_node.next_node

      before_node.next_node = first_node
      prev_node.next_node = after_node
    end

    @count += values.length
    true
  end

  def remove_at(index)
    raise IndexError if index.negative? || index >= @count

    current = @head
    previous = nil

    index.times do
      previous = current
      current = current.next_node
    end

    if previous.nil?
      @head = current.next_node
    else
      previous.next_node = current.next_node
    end

    @tail = previous if current == @tail
    @count -= 1
  end

  def to_s
    return ' ' if @head.nil?

    result = ''
    current = @head
    until current.equal?(@tail)
      result += "( #{current.value} ) -> "
      current = current.next_node
    end

    result += "( #{current.value} )"
    result
  end

  private

  def node_at_index(index)
    return nil unless index.between?(0, @count - 1)

    current_node = @head
    index.times do
      current_node = current_node.next_node
    end

    current_node
  end
end
