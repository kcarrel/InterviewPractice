def search(nums, target)
    b = 0
    e = nums.length - 1
    ##find index of smallest value loop to shrink array window
    while b < e
        median = (b + e) / 2
        if nums[median] > nums[e]
            b = median + 1
        else
            e = median
        end
    end
    #b is the index of smallest value and number of rotation points
    rotation = b
    b = 0
    e = nums.length - 1
    ##typical binary search but accounts for rotation
    while b <= e
        median = (b + e) / 2
        realmid = (median + rotation) % nums.length
        if nums[realmid] == target
            return realmid
        elsif nums[realmid] < target
            b = median + 1
        else
            e = median - 1
        end
    end

    return -1
end


def merge(intervals)
  merged = []
  ## sort by start times
  intervals.sort_by! { |interval| interval[0]}
  intervals.each do |interval|
    if merged.empty? || merged.last[1] < interval[0]
      merged << interval
    else
      merged.last[1] = interval[1] if interval[1] > merged.last[1]
    end
  end

  return merged
end

def can_attend_meetings(intervals)
  ##check if intervals is empty
    if !intervals.empty?
      ## sort by start times
        intervals.sort_by! {|interval| interval[0]}
        #set pointer
        i = 0

        while i < intervals.length - 1
          #check current end versus next start
            if intervals[i][1] > intervals[i + 1][0]
              #if end is greater than start time return false
                return false
            end
            #if not check the next!
            i += 1
        end
    end
    return true
end

def top_k_frequent(nums, k)
  ##empty hash to keep track of number of apperances of a value
    counts = Hash.new(0)
    ##iterate through to add to hash appearances
    nums.each do |num|
        counts[num] += 1
    end
    ##manual sort by comparing keys
    sorted_keys = counts.keys.sort do |k1, k2|
        if counts[k1] == counts[k2]
            k1 <=> k2
        else
            counts[k2] <=> counts[k1]
        end
    end

    return sorted_keys[0...k]
end

## two sum II - input array is sorted
def two_sum(numbers, target)
  ##set hash
  hash = {}
  ##set array
  arr = []

  numbers.each_with_index do |val, idx|
    if hash.key?(target - val)
      arr.push(hash[target - val])
      arr.push(idx + 1)
      break
    else
      hash[val] = idx + 1
    end
  end

  arr
end

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    index = 0
    i = 0
    while i < nums.length
        if nums[i] != 0
            temp =  nums[index]
            nums[index] = nums[i]
            index += 1
            nums[i] = temp
        end
        i += 1
    end
end

#Parity sort
# Intuition behind solution:
#Create an index that will store the next position to place an even number.
#Iterate through the elements of A, checking if each element is even.
#If the current element is even, store the number at the A[index] position as to not overwrite it without storing it, place the current element (A[index]) at the A[index] position, increment index, and place the temporarily stored value at the A[i] position. Once the loop terminates return A as you will have successfully bubbled all even elements to the front of the array and therefore all odd elements to the back of the array.
#Brute Force
def sort_array_by_parity(a)
    i = 0
    j =  a.length - 1
    while i < j
        if a[i] % 2 > a[j] % 2
            temp = a[i]
            a[i] = a[j]
            a[j] = temp
        end
        if a[i] % 2 == 0
            i += 1
        end
        if a[j] % 2 == 1
            j -= 1
        end
    end
  return a
end

def sort_array_by_parity(a)
  # create an index to store next position of even number
  index = 0
  i = 0
  #iterate through
  while  i < a.length
     # if u encounter an even number
    if a[i] % 2 == 0
      #set temp
      temp = a[index]
      a[index] = a[i]
      index += 1
      a[i] = temp
    end
    i += 1
  end
  return a
end

# @param {Integer[]} a
# @return {Integer[]}
def sorted_squares(a)
    result = []
    i = 0
    j = a.length - 1
    k = j
    while k >= 0
        x = a[i] * a[i]
        y = a[j] * a[j]
        if x >= y
            result[k] = x
            i += 1
        else
            result[k] = y
            j -= 1
        end
        k -= 1
    end
    return result
end



def sort(numbers)
    if numbers.size <= 1
      return numbers
    end

    array_size   = numbers.size
    half_of_size = (array_size / 2).round

    left_array  = numbers.take(half_of_size)
    right_array = numbers.drop(half_of_size)

    sorted_left_array = sort(left_array)
    sorted_right_array = sort(right_array)

    merge(sorted_left_array, sorted_right_array)
  end

  # This then creates a new array, loops through the left/right arrays and places the lowest number into the array. 
  def merge(left_array, right_array)
    if right_array.empty?
      return left_array # We have nothing to compare. Left wins.
    end

    if left_array.empty?
      return right_array # We have nothing to compare. Right wins.
    end

    smallest_number = if left_array.first <= right_array.first
      left_array.shift
    else
      right_array.shift
    end

    # We keep doing it until the left or right array is empty.
    recursive = merge(left_array, right_array)

    # Okay, either left or right array are empty at this point. So we have a result.
    [smallest_number].concat(recursive)
  end
end


def linear_search(array, key)
  i = 0
  while i < array.length
      if array[i] == key
        return "#{key} at index #{array.index(key)}"
      end
      i+=1
    end
    return -1
end


def binary_search(array, key)
    low, high = 0, array.length - 1
    while low <= high
      mid = (low + high) >> 1
      case key <=> array[mid]
        when 1
          low = mid + 1
        when -1
          high = mid - 1
        else
          return mid
      end
    end
end

def bfs(node)
  queue = []
  queue.push(node)

  while(queue.size != 0)
    n = queue.shift
    puts n.value
    n.children.each do |child|
      queue.push(child)
    end
  end
end

def merge_sort(array)
  if array.length <= 1
    array
  else
    mid = (array.length / 2).floor
    left = merge_sort(array[0..mid-1])
    right = merge_sort(array[mid..array.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left[0] < right[0]
    [left[0]] + merge(left[1..left.length], right)
  else
    [right[0]] + merge(left, right[1..right.length])
  end
end

def quick_sort(array)
  return array if array.length <= 1
  pivot = array.delete_at(rand(array.length))

  left = Array.new
  right = Array.new

  array.each do |x|
    if x <= pivot
      left << x
    else
      right << x
    end
  end

  return *quick_sort(left), pivot ,*quick_sort(right)

end