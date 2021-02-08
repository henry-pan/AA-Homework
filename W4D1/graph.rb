class GraphNode

  attr_accessor :value, :neighbors

  def initialize(value)
    self.value = value
    self.neighbors = []
  end
  
end

def bfs(starting_node, target_value)
  queue = [starting_node]
  visited = []
  
  until queue.empty?
    node = queue.pop
    
    if !visited.include?(node)
      return node if node.value == target_value
      visited << node
      node.neighbors.each { |neigh| queue.unshift(neigh) }
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

p bfs(a, "b") # @value = b
p bfs(a, "f") # nil
