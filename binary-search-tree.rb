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
    first = 0
    last = sorted.length - 1
    @root = build_tree(sorted, first, last)
  end
  
  def build_tree(array, first, last)
    if first > last 
      return nil
    end
      mid = (first + last) / 2
      root = Node.new(array[mid])

      root.left = build_tree(array, first, mid - 1)
      root.right = build_tree(array, mid + 1, last)

      return root
  end

  def insert(root = @root, value)
    if root == value || root == nil
      return root
    elsif 
      value > root.data
        root.right ? insert(root.right, value) : root.right = Node.new(value)

    elsif value < root.data
        root.left ? insert(root.left, value) : root.left = Node.new(value)
    end
  end

  def delete(node = @root, value)
    if node == nil
      return node

    elsif value > node.data
      delete(node.right, value)

    elsif value < node.data
      delete(node.left, value)

    else
      case
      when node.right == nil && node.left == nil
        return node = nil
      when node.right != nil && node.left == nil
        return node = node.right 
      when node.right == nil && node.left != nil
        return node = node.left
      when node.right != nil && node.left != nil

      end
    end
  end

  def find(value)

  end

  def level_order(block)

  end

  def inorder(block)

  end

  def preorder(block)

  end

  def postorder(block)

  end

  def height(node)

  end

  def depth(node)

  end

  def balanced?

  end

  def rebalance

  end

  def bubble_sort(array)
    
    for i in 0...array.length
    
      for b in 0...(array.length - i - 1) 
       if array[b] > array[b + 1]
         array[b], array[b + 1] = array[b + 1], array[b]
       end
      end
    end
    return array
  end

end

array_data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

data_tree = Tree.new(array_data)
p data_tree.insert(11)
data_tree