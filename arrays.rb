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
