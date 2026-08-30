// In this problem, you're given an array of integers nums and a target integer
// target. Your objective is to find the maximum sum that can be obtained by
// adding two distinct elements from the array, where this sum is less than the
// target.

// Requirements:

// The input will be an array of integers, nums, and a target integer, target.
// You need to find the maximum value of nums[i] + nums[j] where i != j and
// nums[i] + nums[j] < target.
// If no such pair exists, return -1.

function twoSumLessThanTarget(nums, target) {
  let sorted = nums.toSorted();
  let start = 0;
  let end = nums.length - 1;
  let sum;
  let result = -1

  while (start < end) {
    sum = sorted[start] + sorted[end];

    if (sum >= target) {
      end--;
    } else {
      result = sum > result ? sum : result;
      start++;
    }
  }

  return result;
}

console.log(twoSumLessThanTarget([3, 1, 4], 5) === 4);
console.log(twoSumLessThanTarget([8, 2, 4, 9, 5, 10, 1, 7], 16) === 15);
console.log(twoSumLessThanTarget([5, 8, 3, 2, 1], 6) === 5);
console.log(twoSumLessThanTarget([6, 8, 10, 12], 5) === -1);
console.log(twoSumLessThanTarget([1, 2, 3, 4, 5], 100) === 9);
console.log(twoSumLessThanTarget([10, 20, 30, 40, 50], 40) === 30);
console.log(twoSumLessThanTarget([7, 4, 15, 11, 21, 9], 24) === 22);
// All test cases should log true