// Write a function named `minLengthForTargetSum` that
// determines the minimal length of a contiguous subarray
// within an array of positive integers, `nums`. This
// subarray should have a sum that is greater than or
// equal to a specified positive integer, `target`. The
// function should return the length of this subarray.
// If no such subarray exists, return 0.

// Example:
// Input: nums = [4, 2, 5, 7], target = 10
// Output: 2
// Explanation: In this example, the shortest subarray that
//              meets or exceeds the target sum of 10 is [5, 7].
//              This subarray sums to 12, which is greater than
//              the target sum of 10. The length of this
//              subarray is 2.
/*

Use anchor runner
start with anchor and runner both === 0 (since it's possible that a single
value could be greater than target)

Stop when anchor = nums.length

if sum(subarr) >= target, we know that we have found the SMALLEST subarr that
includes the anchor value (since we started looking at JUST the anchor value by
itself and then incorporated more elements one at a time)

when that happens we should bump anchor by 1 and leave runner in place
*/

function sum(nums) {
  return nums.reduce((sum, num) => sum + num, 0);
}

function minLengthForTargetSum(nums, target) {
  let anchor = 0;
  let runner = 0;
  let minLength = Infinity;

  while (anchor < nums.length && runner < nums.length) {
    let currSum = sum(nums.slice(anchor, runner + 1));
    let length = 1 + (runner - anchor);
    // console.log(currSum, length);

    if (currSum < target) {
      runner++;
    } else {
      
      if (minLength > length) minLength = length
      anchor++;
    }
  }

  return minLength === Infinity ? 0 : minLength;
}

console.log(minLengthForTargetSum([1, 2, 3], 5) === 2);
console.log(minLengthForTargetSum([1, 1, 1], 4) === 0);
console.log(minLengthForTargetSum([8, 2, 1, 4], 8) === 1);
console.log(minLengthForTargetSum([1, 2, 3, 4, 5], 9) === 2);
console.log(minLengthForTargetSum([1, 4, 1, 3, 6, 2], 9) === 2);
console.log(minLengthForTargetSum([1, 2, 3, 4], 10) === 4);
console.log(minLengthForTargetSum([1, 2, 6, 1, 1, 7], 9) === 3);
console.log(minLengthForTargetSum([4, 2, 2, 1, 5, 2], 14) === 5);

// All test cases should log true