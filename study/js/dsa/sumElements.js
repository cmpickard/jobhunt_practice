// Given an array of integers nums, find sum of all of its elements
// using recursion.

// Example test cases:

function sum(nums) {
  if (nums.length === 0) return 0
  return nums.pop() + sum(nums);
}

console.log(sum([1, 2, 3]) === 6);
console.log(sum([10, 15, 20, 10, 5]) === 60);
console.log(sum([-5, -1, 5, 2, -3]) === -2);
console.log(sum([7]) === 7);
console.log(sum([]) === 0);
