class Stack

  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end

end


class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue[-1]
  end

end


class Map

  def initialize
    @map = []
  end
  
  def set(key, value)
    @map.each do |ele|
      if ele[0] == key
        ele[1] = value
        return
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each { |ele| return ele[1] if ele[0] == key }
    nil
  end

  def delete(key)
    @map.each_with_index do |ele, i|
      if ele[0] == key
        @map.delete_at(i)
        return
      end
    end
  end

  def show
    @map
  end

end

