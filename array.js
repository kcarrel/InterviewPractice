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

