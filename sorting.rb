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
