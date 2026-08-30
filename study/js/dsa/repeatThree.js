// Given an array nums, sorted in ascending order (where elements are equal to or
//   increase as you move through the array), determine if a specified number,
//   target, appears more than three times in the array. The function should
//   return true if target is found at least four times, and false otherwise.

// Example test cases:

function isTargetFrequent(nums, target) {
  let top = -1;
  let bottom = -1;
  let left = 0;
  let right = nums.length - 1;

  // search for bottom
  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (nums[mid] === target && (mid === 0 || nums[mid - 1] !== target)) {
      bottom = mid;
      break;
    } else if (nums[mid] >= target) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  // search for top
  left = 0;
  right = nums.length - 1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (nums[mid] === target && (mid === nums.length - 1 || nums[mid + 1] !== target)) {
      top = mid;
      break;
    } else if (nums[mid] <= target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return (top - bottom >= 3);
}

console.log(isTargetFrequent([1, 2, 3, 3, 3, 3, 4], 3) === true);
console.log(isTargetFrequent([1, 1, 1, 1, 2, 3, 4], 1) === true);
console.log(isTargetFrequent([1, 2, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([1, 1, 3, 4, 5], 2) === false );
console.log(isTargetFrequent([2, 2, 2, 3, 3, 3, 4], 3) === false);
console.log(isTargetFrequent([4, 4, 4, 4, 4, 4, 4], 4) === true);

// All test cases should log true.