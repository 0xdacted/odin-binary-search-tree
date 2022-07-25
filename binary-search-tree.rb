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
        elsif !node.right.right.nil? && !node.right.left.nil?
          node_options = inorder(node.right)
          node.right = node_options[(node_options.length + 1) / 2]
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
        elsif !node.left.right.nil? && !node.left.left.nil?
          node_options = inorder(node.left)
          node.left = node_options[(node_options.length + 1) / 2]
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

  def level_order(node = @root, queue = [], result = [])
    queue.push(node)
    while queue.length != 0
      node = queue.shift
      block_given? ? yield(node) : result.push(node.data)
      children = [node.left, node.right].compact
      children.each do |child|
        queue.push(child)
      end
    end
    result unless block_given?
  end

  def inorder(node = @root, result = [])
    return if node.nil?

    inorder(node.left, result)
    block_given? ? yield(node) : result.push(node.data)
    inorder(node.right, result)
    result unless block_given?
  end

  def preorder(node = @root, result = [])
    return if node.nil?

    block_given? ? yield(node) : result.push(node.data)

    preorder(node.left, result)
    preorder(node.right, result)
    result unless block_given?
  end

  def postorder(node = @root, result = [])
    return if node.nil?

    postorder(node.left, result)
    postorder(node.right, result)
    block_given? ? yield(node) : result.push(node.data)
    result unless block_given?
  end

  def height(value, left_height = 0, right_height = 0)
    node = find(value)
    if node.left != nil
      left_height += 1
      until node.left == nil
        left_height += 1
        node = node.left
      end
    end
    if node.right != nil
      right_height += 1
      until node.right == nil
        right_height += 1
        node = node.right
      end
    end
    left_height > right_height ? left_height : right_height
  end

  def depth(value, node = @root, depth = 0)
    if node.nil?
      return
    elsif node.data == value
        depth
    elsif value > node.data
      depth += 1
      depth(value, node.right, depth)
    elsif value < node.data
      depth += 1
      depth(value, node.left, depth)
    end
  end

  def balanced?(node = @root, left_height = 0, right_height = 0)
    left_height = height(node.left.data) unless node.left.nil?
    right_height = height(node.right.data) unless node.right.nil?
    height_difference = (left_height - right_height).abs
    if height_difference > 1
      p "This tree is unbalanced, one side is #{height_difference} nodes taller than the other"
    else
      p "This tree is balanced, one side is #{height_difference} nodes taller than the other"
    end
  end

  def rebalance
    rebalanced = self.inorder
    rebalanced_tree = Tree.new(rebalanced)
  end

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
p data_tree.rebalance
