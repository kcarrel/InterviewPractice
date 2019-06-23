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
