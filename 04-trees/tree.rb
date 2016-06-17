require_relative 'tree-node'

class Tree
  attr_accessor :root
  def initialize(args = {})
    @root = args.fetch(:root) do
      self.class.build_random_tree(args.fetch(:depth, 3))
    end
  end

  def self.build_random_tree(depth)
    return TreeNode.new(rand(0..50)) if depth == 1
    left = self.build_random_tree(depth - 1)
    right = self.build_random_tree(depth - 1)
    TreeNode.new(rand(0..50), left, right)
  end

  def depth(node=root)
    return 1 if node.left == nil && node.right == nil

    left_depth = depth(node.left)
    right_depth = depth(node.right)

    [left_depth, right_depth].max + 1
  end

  # print the tree in-order (left, then root, then right)
  def in_order_traversal(tree=root, ordering=[])
    return ordering if tree == nil

    in_order_traversal(tree.left, ordering)
    ordering << tree.value
    in_order_traversal(tree.right, ordering)

    ordering
  end

  # print the tree pre-order (root, then left, then right)
  def pre_order_traversal(tree=root, ordering=[])
    return ordering if tree == nil

    ordering << tree.value
    pre_order_traversal(tree.left, ordering)
    pre_order_traversal(tree.right, ordering)

    ordering
  end

  # print the tree post-order (left, then right, then root)
  def post_order_traversal(tree=root, ordering=[])
    return ordering if tree == nil

    post_order_traversal(tree.left, ordering)
    post_order_traversal(tree.right, ordering)
    ordering << tree.value

    ordering
  end
end
