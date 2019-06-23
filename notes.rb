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

def length_of_longest_substring(s)
  return 0 if s.length == 0
  h = {}
  max = 0
  start = 0

  0.upto(s.length - 1) do |i|
    if h.key? s[i]
      start = [start, h[s[i]] + 1].max
    end
    h[s[i]] = i
    max = [max, i-start + 1].max
  end
  max
end

## remove duplicates by assigning duplicates to nil then deleting all nil values

def remove_duplicates(nums)
    return if nums.length == 0
    nums.each_with_index do |number, index|
        if number == nums[index + 1]
            nums[index] = nil
        end
    end
    nums.delete(nil)
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

def is_palindrome(s)
  s = s.gsub(/[^a-zA-Z\d]/, "").downcase
  i = 0
  j = s.length - 1
  while i < j
    return false if s[i] != s[j]
    i += 1
    j -= 1
  end

  true
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

def missing_number(nums)
    total = (nums.length)*(nums.length + 1)/2
    sum = 0
    nums.each do |number|
        sum += number
    end
    return total - sum
end
