class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = Array.new
  end

  def assign(key, value)
    if self.lookup(key)
      remove(key)
      @map << [key, value]
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each {|k, v| return v if k == key}
    nil
  end

  def remove(key)
    @map.reject! {|k, _| k == key}
  end

  def show
    @map
  end
end
