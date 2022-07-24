class Node
  include Comparable
  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end

end

class Tree

  def initialize(array)
    sorted = bubble_sort(array.uniq)
    @root = build_tree(sorted)
    
  end
  
  def build_tree(array)
    p first = array[0]
    p last = array[-1]
    p mid = array.length/2
    
  end

  def insert(value)

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

p data_tree = Tree.new(array_data)