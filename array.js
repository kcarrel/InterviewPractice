// inplace removal of duplicates in a sorted array
var removeDuplicates = function(nums) {
    var pointer = 1
    for (i = 0; i < nums.length - 1; i++) {
        if (nums[i] !== nums[i+1]) {
            nums[pointer++] = nums[i + 1];
        }
    }
    return pointer;
};


var twoSum = function(nums, target) {
    var Hash = {};
    var result = [];
    for(var i = 0; i < nums.length; i++) {
        var difference = target - nums[i]
        var index = Hash[difference]
        if (typeof index !== 'undefined') {
            return [index, i];
        } else {
            Hash[nums[i]] = i; 
        }
    }
};
