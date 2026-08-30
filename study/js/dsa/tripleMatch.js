// You have an ordered array nums consisting of integers. Your task is to
// determine whether there are any two distinct elements in the array where one
// element is exactly three times the value of the other element. The time
// complexity of the solution should be O(N).

// Restrictions:

// You should not use built-in methods like filter, map, reduce, or find.
// Do not use the includes method for checking existence in the array.
// Avoid using indexOf or lastIndexOf.

function checkTripleMatch(nums) {
 let anchor = 0;
 let runner = 1;

 while (anchor <= nums.length - 2) {
  if (runner >= nums.length || nums[anchor] * 3 < nums[runner]) {
    anchor++;
    runner = anchor + 1;
  } else if (nums[anchor] * 3 > nums[runner]) {
    runner++;
  } else if (nums[anchor] * 3 === nums[runner]){
    return true;
  }
 }

 return false;
}

// Example test cases:
console.log(checkTripleMatch([1, 3, 9, 28]) === true);
console.log(checkTripleMatch([1, 2, 4, 10, 11, 12]) === true);
console.log(checkTripleMatch([0, 5, 7, 55]) === false);
console.log(checkTripleMatch([4, 5, 7, 9, 13, 15, 17]) === true);
console.log(checkTripleMatch([2, 6, 13, 54]) === true);
console.log(checkTripleMatch([1, 5, 17, 51]) === true);
console.log(checkTripleMatch([1, 2, 4, 8]) === false);