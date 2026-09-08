// Imagine a series of vertical barriers arranged in a straight
// line at equal distances across a flat field.
// These barriers have different heights. After a rainstorm,
// water collects between the barriers, forming reservoirs.
// Your task is to determine the maximum volume of rainwater
// that can be captured between any two barriers, without
// the water spilling over the tops of those two barriers.

// Write a function `maxRainwater` that takes an array of
// barrier `heights` and calculates the maximum volume
// of rainwater that can be harvested between any two barriers.

// The array `heights` represents the height of each barrier,
// where `heights[i]` is the height of the i-th barrier.
// The distance between each barrier is uniform.

// The input array will contain at least 2 values.

// Example:
// Input: [1, 2, 1]
// Output: 2
// Explanation: The distance between the first and
// third barrier is 2, and the height is 1, so
// the maximum amount of rainfall is 2 * 1 = 2

//   |    =>    |
// |_|_|      |*|*|

// Example:
// Input: [2, 3, 4, 2]
// Output: 6
// Explanation: The distance between the first and
// fourth barrier is 3, and the height is 2, so the
// maximum amount of rainfall is 3 * 2 = 6

//     |            |
//   | |    =>    | |
// | | | |      |*|*|*|
// |_|_|_|      |*|*|*|

//     |   |          |   |
//   | |   |  =>    |*|* *|
// | | | | |      | |*|*|*|
// |_|_|_|_|      | |*|*|*|
 
// 100, 100, 1, 1, 1, 10 => not 50, but the 100
/*
for any two indices, i and j, the volume of water equals, width * height
(j - i) -- the width
Math.min(arr[j], arr[i]) -- height

so,

(j - i) * Math.min(arr[j], arr[i])

we'll do a two-pointers search, but should i do a start/end or an anchor/runner?

start/end

note the area of the current selection
note which wall is shortest
there is not section that includes the shorter wall and is TALLER than
the current selection (b/c we are using start end -- all other selections will
be less wide but no taller)
thus, we move the shorter wall side in by one index
keep going, noting down the largest areas we see until start == end


*/

function maxRainwater(heights) {
  let start = 0;
  let end = heights.length - 1;
  let maxArea = -1;
  
  while (start < end) {
    let minSide = Math.min(heights[start], heights[end])
    let currArea = minSide * (end - start);
    if (currArea > maxArea) maxArea = currArea;
    if (heights[start] === minSide) {
      start++;
    } else {
      end--;
    }
  }

  return maxArea;
}

console.log(maxRainwater([1, 1]) === 1);
console.log(maxRainwater([1, 3]) === 1);
console.log(maxRainwater([1, 2, 1]) === 2);
console.log(maxRainwater([2, 3, 4, 2]) === 6);
console.log(maxRainwater([2, 2, 2, 2, 2]) === 8);
console.log(maxRainwater([2, 9, 5, 10, 5, 6]) === 24);
console.log(maxRainwater([5, 4, 3, 2, 9, 10, 3, 4, 5]) === 40);
console.log(maxRainwater([3, 1, 2, 5, 2, 4, 2, 5, 6, 1, 5, 3, 2, 3, 4, 1, 2]) === 44);
console.log(maxRainwater([2, 2, 13, 9, 1, 15, 2, 5, 9, 7, 5, 3, 6, 3, 4, 1, 4, 5]) === 75);