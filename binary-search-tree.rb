class Node
  include Comparable
  attr_accessor :left_child, :right_child, :data

  def initialize(data)
    @data = data
    @left_child = left_child
    @right_child = right_child
  end

end

class Tree
  attr_reader :root

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

      root.left_child = build_tree(array, first, mid - 1)
      root.right_child = build_tree(array, mid + 1, last)

      return root
  end

  def insert(root = @root, value)
    if root == nil || root == value
      return root
    elsif 
      value > root.data
      if root.right_child == nil
        root.right_child = Node.new(value)
      else
        root = root.right_child
        insert(root, value)
      end
    elsif value < root.data
      if root.left_child == nil
        root.left_child = Node.new(value)
      else
      root = root.left_child
      insert(root, value)
      end
    end
  end

  def delete(value)

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
p data_tree