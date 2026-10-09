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
end
