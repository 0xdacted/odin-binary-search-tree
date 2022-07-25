class Node
  include Comparable
  attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root

  def initialize(array)
    sorted = bubble_sort(array.uniq)
    @root = build_tree(sorted, 0, sorted.length - 1)
    @@preorder_result = []
  end

  def build_tree(array, first, last)
    return nil if first > last

    mid = (first + last) / 2
    root = Node.new(array[mid])

    root.left = build_tree(array, first, mid - 1)
    root.right = build_tree(array, mid + 1, last)

    root
  end

  def insert(node = @root, value)
    if node == value || node.nil?
      node
    elsif value > node.data
      node.right ? insert(node.right, value) : node.right = Node.new(value)

    elsif value < node.data
      node.left ? insert(node.left, value) : node.left = Node.new(value)
    end
  end

  def delete(node = @root, value)
    if node.nil? || node == value
      node

    elsif value > node.data
      if value == node.right.data
        if node.right.right.nil? && node.right.left.nil?
          node.right = nil
        elsif !node.right.right.nil? && node.right.left.nil?
          node.right = node.right.right
        elsif node.right.right.nil? && !node.right.left.nil?
          node.right = node.right.left
        end
      else
        delete(node.right, value)
      end

    elsif value < node.data
      if value == node.left.data
        if node.left.right.nil? && node.left.left.nil?
          node.left = nil
        elsif !node.left.right.nil? && node.left.left.nil?
          node.left = node.left.right
        elsif node.left.right.nil? && !node.left.left.nil?
          node.left = node.left.left
        end
      else
        delete(node.left, value)
      end
    end
  end

  def find(node = @root, value)
    if node.nil? || node.data == value
      node

    elsif value > node.data 
      find(node.right, value)

    elsif value < node.data
      find(node.left, value)
    end
  end

  def level_order(node = @root)
      queue = []
      passed_values = []
      queue.push(node)
      while(queue.length != 0)
        node = queue.shift
        block_given? ? yield(node) : passed_values.push(node.data)
        children = [node.left, node.right].compact
        children.each do |child|
          queue.push(child)
        end
      end
      passed_values unless block_given?
  end

  
  def inorder(block); end

  def preorder(node = @root, result = [])
    if node == nil
      return
    end
    block_given? ? yield(node) : result.push(node.data)
    
    preorder(node.left, result) 
    preorder(node.right, result) 
    result unless block_given?
  end

  def postorder(block); end

  def height(node); end

  def depth(node); end

  def balanced?; end

  def rebalance; end

  def bubble_sort(array)
    for i in 0...array.length

      for b in 0...(array.length - i - 1)
        array[b], array[b + 1] = array[b + 1], array[b] if array[b] > array[b + 1]
      end
    end
    array
  end
end

array_data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

data_tree = Tree.new(array_data)
data_tree.level_order 
p data_tree.preorder


