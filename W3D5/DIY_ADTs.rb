# Exercise 1 - Stack
# Let's write a Stack class. To do this, use the following framework:

  class Stack
    attr_reader :stacks

    def initialize
        @stacks = []
      # create ivar to store stack here!
    end

    def push(el)
        @stacks << el
      # adds an element to the stack
    end

    def pop
        @stacks.pop
      # removes one element from the stack
    end

    def peek
        @stacks.last
      # returns, but doesn't remove, the top element in the stack
    end
    
  end

  # To test that your code works, create a new instance of the Stack class, and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!

#   s = Stack.new
#   p s.push("a")
#   p s.push("b")
#   p s.push("c")
#   p s.pop
#   p s.stacks
#   p s.peek
#   p s.stacks


# Exercise 2 - Queue
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and peek.

class Queue
    attr_reader :queue
    
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
        @queue.last 
    end

end

#   q = Queue.new
#   p q.enqueue("a")
#   p q.enqueue("b")
#   p q.enqueue("c")
#   p q.dequeue
#   p q.queue
#   p q.peek
#   p q.queue

# Test your code to ensure it follows the principle of FIFO.

# Exercise 3 - Map
# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.

# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show. Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. 
# It's up to you to check whether a key currently exists!

# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map
    attr_reader :map

    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key, value] if @map.empty?

        @map.each_with_index do |key_subarr, idx|
            if key_subarr.first == key
                @map[idx][1] = value
            else
                @map << [key, value]
            end
        end
    end

    def get(key)
        @map.each_with_index do |key_subarr, idx|
            return @map[idx][1] if key_subarr.first == key
        end
        return nil
    end

    def delete(key)
        @map.each_with_index do |key_subarr, idx|
            return @map.delete(key_subarr) if key_subarr.first == key
        end
        return nil
    end
end

# m = Map.new
# p m.set(2, 4)
# puts
# p m.set("age", 26)
# puts
# p m.get("age")
# puts
# p m.delete(2)
# puts
# p m.map
# puts
# p m.set("hello", "world")
# puts
# p m.delete("age")
# puts
# p m.map