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
