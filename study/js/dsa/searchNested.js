// In this problem, you're presented with a nested array, matrix, which has
// two key characteristics:

// Each subarray in the matrix is sorted in ascending order.
// The first element of each subarray is larger than the final element of the
// preceding subarray.
// Your task is to determine whether a given integer, target, exists within
// this nested array.

// The time complexity of your solution should be O(log(M*N)).

// Example test cases:

function findInNestedArray(matrix, target) {
  let left = 0;
  let right = matrix.length - 1;
  let idx = -1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    let midLastEl = matrix[mid][matrix[mid].length - 1];
    if (matrix[mid][0] <= target && midLastEl >= target) {
      idx = mid
      break;
    } else if (matrix[mid][0] > target) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  if (idx === -1) return false

  let subarr = matrix[idx];
  left = 0;
  right = subarr.length - 1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);

    if (subarr[mid] === target) {
      return true;
    } else if (subarr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return false;
}

console.log(findInNestedArray([[4, 8, 12], [16, 20, 24], [28, 32, 36]], 20) === true);
console.log(findInNestedArray([[3, 6, 9], [12, 15, 18], [21, 24, 27]], 27) === true);
console.log(findInNestedArray([[1, 3, 5], [7, 9, 11], [13, 15, 17]], 19) === false);
console.log(findInNestedArray([[10, 20, 30], [40, 50, 60], [70, 80, 90]], 10) === true);
console.log(findInNestedArray([[15, 25, 35], [45, 55, 65], [75, 85, 95]], 5) === false);

// All test cases should return true.