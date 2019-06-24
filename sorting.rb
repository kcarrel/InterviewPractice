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
