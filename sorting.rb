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
