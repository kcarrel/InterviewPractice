def max_depth(root)
    return 0 if root.nil?
    count = 0
    queue = []
    queue.push(root)
    while !queue.empty?
        count += 1
        width = queue.size
        while width != 0
            node = queue.shift
            queue.push(node.left) unless node.left.nil?
            queue.push(node.right) unless node.right.nil?
            width -= 1
        end
    end
    return count
end

#recursive solution for binary tree merge
def merge_trees(t1, t2)
    return t2 if t1 == nil
    return t1 if t2 == nil
    value = t1.val += t2.val
    new = TreeNode.new(value)
    new.left = merge_trees(t1.left, t2.left)
    new.right = merge_trees(t1.right, t2.right)
    return new
end
