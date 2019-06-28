## Arrays and Strings prep problems

#Two Sum problem
#Example
#Given nums = [2, 7, 11, 15], target = 9,

#Because nums[0] + nums[1] = 2 + 7 = 9,
#return [0, 1].
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    # make an empty hash
    search = Hash.new
    #iterate through nums
    nums.each_with_index do |item, index|
      # calculate a complement value based on current item
        complement = target - item
        # if current item exists return the complement index and current index
        if search.has_key?(complement)
            return [search[complement],index]
        end
        # if not add in new item the search[key: item] : index
        search[item] = index
    end
end

# Reverse a string in-place (do not allocate new memory for a string)

def reverse_string(s)
    #beginning pointer
    start = 0
    #end pointer
    finish =   s.length - 1
    # go through and switch s[]
    while start < finish
      #make a temporary of the last examined end pointer char
        temp = s[finish]
        # assign start to finish
        s[finish] = s[start]
        # set start to the saved temp (end pointer)
        s[start] = temp
        # move further into the string by adding/subtracting to pointers
        start += 1
        finish -= 1
    end
    s
end

#Longest substring without repeating characters
def length_of_longest_substring(s)
  ##immediately catch empty Strings
  return 0 if s.length == 0
  #create empty hash
  h = {}
  #make pointers equal to 0
  #this will define your 'sliding window'
  max = 0
  start = 0
  #iterate through string
  0.upto(s.length - 1) do |i|
    #check if hash contains the character you are currently on in string
    #if it does (meaning repeated char) move the start pointer to the index of the character that is repeated + 1
    if h.key? s[i]
      start = [start, h[s[i]] + 1].max
    end
    #add in character with current index
    h[s[i]] = i
    #update max count
    max = [max, i-start + 1].max
  end
  max
end

## remove duplicates by assigning duplicates to nil then deleting all nil values

def remove_duplicates(nums)
    ## catch empty
    return if nums.length == 0
    ##iterate through with index
    nums.each_with_index do |number, index|
    # check duplicate and assign nil for later deletion
        if number == nums[index + 1]
            nums[index] = nil
        end
    end
    nums.delete(nil)
end

#check to see if a string can be a palindrome (ignoring punctuation)
def is_palindrome(s)
  ## sanitize the string
  s = s.gsub(/[^a-zA-Z\d]/, "").downcase
  i = 0
  j = s.length - 1
  #iterate through from start and end pointers to compare characters
  while i < j
    return false if s[i] != s[j]
    i += 1
    j -= 1
  end

  true
end

## check to see what number in an array (0,1...n) is missing
def missing_number(nums)
  #calculate the total expected for the array based on length
    total = (nums.length)*(nums.length + 1)/2
    sum = 0
    #go through each number in array and add to sum
    nums.each do |number|
        sum += number
    end
    #subtract sum from total to find the missing number
    return total - sum
end

#Kth largest element in an array
#sort the array and return the kth to last number(this will be the kth largest element)
#iterate through numbers placing each in a min heap
#If the heap's size exceeds k, remove an element from the heap. After you'd iterated through all your numbers, the last k element in the array will be in the heap. Therefore, the kth largest thing will be at the root of the heap, so we return it.

#o(n)
def find_kth_largest(nums, k)

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

#Power of Two
def is_power_of_two(n)
   i = 1
    while i < n
        i *= 2
    end
    return i == n
end

#first unique char
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
