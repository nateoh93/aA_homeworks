require "byebug"
require "set"

class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def inspect
        @value
    end
    
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    tracker = Set.new()

    # debugger
    until queue.empty?
        node = queue.shift
        if !tracker.include?(node)
            return node.value if node.value == target_value
            tracker.add(node)
            queue += node.neighbors
        end
    end

    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")
