// In this problem, you're given an array of numbers nums, and a specific integer
// k. Your objective is to compute the average value of each contiguous subarray
// of length k within the given array.

// Requirements:

// The input will be an array of numbers and an integer k.
// You need to find the average of every contiguous subarray of size k in the
// array.
// The output should be an array containing these averages.

function findAverages(arr, k) {
  let result = [];
  let total = 0;
  
  // time: O(1) scales w/ k
  for (let idx = 0; idx < k; idx++) {
    total += arr[idx]
  }

  result.push(total / k);

  let sub_arrs = arr.length - k;
  // time: O(N)
  for (let remove_idx = 0; remove_idx < sub_arrs; remove_idx++) {
    total -= arr[remove_idx];
    total += arr[remove_idx + k];
    result.push(total / k);
  }

  return result;
}

console.log(findAverages([1, 2, 3, 4, 5, 6], 3)); // [ 2, 3, 4, 5 ]
console.log(findAverages([1, 2, 3, 4, 5], 2));    // [1.5, 2.5, 3.5, 4.5]
console.log(findAverages([10, 20, 30, 40, 50], 4)); // [ 25, 35 ]
console.log(findAverages([5, 5, 5, 5, 5], 1));      // [ 5, 5, 5, 5, 5 ]
console.log(findAverages([1, 3, 2, 6, -1, 4, 1, 8, 2], 5)); // [2.2, 2.8, 2.4, 3.6, 2.8]