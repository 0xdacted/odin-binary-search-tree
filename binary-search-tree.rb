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
    @root = build_tree(array)

  end
  
  def build_tree(array)

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

end