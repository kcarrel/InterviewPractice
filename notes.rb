## check to see if closing/opening brackets match using a hash and a stack
def is_valid(s)
    stack = []
    brackets = {
        ')' => '(',
        ']' => '[',
        '}' => '{'
        }
    (0...s.length).each do |i|
        if c = brackets[s[i]]
            return false if stack.pop != c
        else
            stack << s[i]
        end
    end
    return stack.empty?
end

def first_uniq_char(s)
    count = Hash.new(0)
    s.chars.each do |letter|
        count[letter] += 1
    end
    if count.value?(1)
        return s.index(count.key(1))
    else
        return -1
    end
end




##best time to buy and sell

def max_profit(prices)
    best = 0
    ##return if prices only has one number
    return best if prices.size <= 1
    ##check each price against the next
    prices.each_with_index do |p, i|
        if prices[i+1] && prices[i+1] > p
            best+=(prices[i+1] - p)
        end
    end
    best
end

##rotate an array
##just unshit and pop k times
def rotate(nums, k)
    k.times { |x| nums.unshift(nums.pop) }
end

##Return the non-duplicate number
def single_number(nums)
    count = Hash.new(0)
    nums.each { |el| count[el] += 1 }
    count.each { |k,v| return k if v == 1  }
end

## intersection of 2 arrays
## create a hash of one number array
## iterate through second array and check if hash contains the number
## if yes push into an array to return at end and subtract one from the Hash[number]
def intersect(nums1, nums2)
    numHash1 = Hash.new(0)
    nums1.each do |number|
        numHash1[number] += 1
    end
    intersection = []
    nums2.each do |number|
        if numHash1[number] != 0
            intersection.push(number)
            numHash1[number] -= 1
        end
    end
    return intersection
end

##work backwards to carry the remainder
def plus_one(digits)
  n = digits.length - 1
  digits[n] += 1
  for i in 0..n
    if digits[n-i] == 10
      digits[n-i] = 0
      if i != n
        digits[n-i-1] += 1
      else
        digits.unshift(1)
      end
    end
  end
  digits
end

## move all 0s to end of array
## just count the 0s in the array, delete them then add them onto the end of the array

def move0s(nums)
  zeros = nums.count(0)
    nums.delete(0)
    zeros.times do |zero|
        nums.push(0)
    end
    nums
end

##reverse a string!
## use pointers to look at beginning and end letters
def reverse_string(s)
    start = 0
    finish =   s.length - 1
    while start < finish
        temp = s[finish]
        s[finish] = s[start]
        s[start] = temp
        start += 1
        finish -= 1
    end
    s
end

#reverse a linked list
def reverse_list(head)
    #if head is nil or only 1 node just return
    if head == nil || !head.next
        return head
    end

    current = head.next
    reversed = head
    reversed.next = nil

    while (current)
        #set temporary node to current
        temporary = current
        #set current to the node current used to point to
        current = current.next
        temporary.next = reversed
        reversed = temporary
    end

    return reversed
end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(node)
    #set a temporary and check
     next_node = node.next
   if next_node != nil
       node.val = next_node.val
       node.next = next_node.next
   end

end

def remove_nth_from_end(head, n)
    return nil unless head.next
    count = 0
    h, p = head, head
    while h
        p = p.next if count > n
        h = h.next
        count += 1
    end
    return head.next if count == n
    p.next = p.next.next
    head
end

class MinStack

=begin
    initialize your data structure here.
=end
    def initialize()
        @min = []
        @stack = []
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        @stack.push(x)
        if @min.empty? || x <= @min[-1]
            @min.push(x)
        end
    end


=begin
    :rtype: Void
=end
    def pop()
        if @stack[-1] == @min[-1]
            @min.pop()
        end
        @stack.pop()
    end


=begin
    :rtype: Integer
=end
    def top()
        @stack[-1]
    end


=begin
    :rtype: Integer
=end
    def get_min()
        @min[-1]
    end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

def group_anagrams(strs)
      strs.group_by { |s| s.chars.sort }.values.map(&:sort)
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
    return [] if root.nil?
    result = []
    level_array = []
    queue = [root]
    i1 = 1
    i2 = 0
    while item = queue.shift do
        i1 -= 1
        level_array << item.val

        if item.left
            queue << item.left
            i2 += 1
        end

        if item.right
            queue << item.right
            i2 += 1
        end

        if i1 == 0
            result << level_array
            level_array = []
            i1 = i2
            i2 = 0
        end
    end
    result
end


##recursive solution for finding the range sum of a binary search TreeNode
def range_sum_bst(root, l, r)
    return 0 unless root

    sum = (l <= root.val && root.val <= r) ? root.val : 0

    return sum unless root.left || root.right

    sum += range_sum_bst(root.left, l, r) if root.val > l
    sum += range_sum_bst(root.right, l, r) if root.val < r

    sum
end


##container with most water
def max_area(height)
    ##start with beginning and ending pointers
    i = 0
    j = height.length - 1
    water = 0
    while i < j
        a = j - i
        b = 0
        if height[i] < height[j]
            b = height[i]
            i += 1
        else
            b = height[j]
            j -= 1
        end
        w = a * b
        water = w > water ? w : water
    end
    water
end

##faster runtime
def max_area(array_list)
    maxarea = 0
    l, r, max_area = 0, array_list.length - 1, 0
    while l < r
        max_area = [max_area, [array_list[l], array_list[r]].min * (r - l)].max
        if array_list[l] < array_list[r]
            l += 1
        else
            r -= 1
        end
    end
    return max_area
end

def circleOfNumbers(n, firstNumber)
    return (firstNumber+(n/2)) % n
end


def stringPermutations s
  [].| s.chars.permutation.sort.map &:join
end

class Logger

=begin
    Initialize your data structure here.
=end
    def initialize()
        @timestamps = Array.new(10){0}
        @buckets = Array.new(10){Set.new}
    end


=begin
    Returns true if the message should be printed in the given timestamp, otherwise returns false.
        If this method returns false, the message will not be printed.
        The timestamp is in seconds granularity.
    :type timestamp: Integer
    :type message: String
    :rtype: Boolean
=end
    def should_print_message(timestamp, message)
        i = timestamp % 10
        if timestamp != @timestamps[i]
            @buckets[i].clear()
            @timestamps[i] = timestamp
        end
        (0...10).each do |j|
            if timestamp - @timestamps[j] < 10 && @buckets[j].include?(message)
                return false
            end
        end
        
        @buckets[i].add(message)
        return true
    end
end


#dp fib
def fib(n)
    return 0 if n.zero?
    return 1 if 1 == n
    a = 0
    b = 1
    value = 0
    (2..n).each do |i|
        value = a + b
        a, b = b, value
    end
    value 
end