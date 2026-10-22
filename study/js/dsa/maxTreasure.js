// An adventurer is embarking on a quest through a mysterious grid-like
// landscape filled with hidden treasures. The landscape is represented by a grid
// with M rows and N columns. Our adventurer begins their journey in the top-left
// corner and aims to reach the bottom-right corner, all while gathering as much
// treasure as possible.
//
// Rules:
// 1. The adventurer can only move in two directions: right and down.
// 2. Each cell in the grid contains a certain amount of treasure, represented by
//    a non-negative integer.
// 3. Upon entering a cell, the adventurer automatically collects the treasure there.
//
// Task:
// Create a function `maxTreasure` that takes a 2D grid as input. Each cell
// in the grid contains a non-negative integer representing the amount of treasure.
// The function should return the maximum possible treasure the adventurer can
// accumulate while traveling from the top-left to the bottom-right corner.
//
// Example:
// grid = [
//   [1, 3, 1, 5],
//   [2, 2, 4, 1],
//   [5, 0, 2, 3],
//   [0, 6, 1, 2]
// ]
//
// maxTreasure(grid) should return 17
//
// Explanation: The optimal path is 1 -> 3 -> 2 -> 4 -> 2 -> 3 -> 2
// collecting a total of 17 treasure units.
//
// Constraints:
// - The grid will always have at least one cell.
// - All values in the grid will be non-negative integers.
// - The grid dimensions M and N will be positive integers.

/*
  for each spot, value in memo is Math.max(up, left) -- if no up or no left,
  substitute 0 for that value, except for top left which starts with value of
  grid[0][0]

  RECURSIVE:

  Base Case: need max for 0,0. Return grid[0][0]
  N + 1: need max for x,y. Return grid[x][y] + Math.max(calc(x - 1, y), calc(x, y - 1))
  -- "calc" is our inner recursive function
  
  if calc gets called with a negative val for x or y, return 0 -- that way
  the edges

  keep a memo object using the x,y vals as the key and the calc'd max as the
  value
*/

// recursive version
function maxTreasure(grid) {
  let memo = new Array(grid.length).fill().map(_ => {
    return new Array(grid[0].length).fill(null);
  });
  memo[0][0] = grid[0][0];

  function calc(row, col) {
    if (row < 0 || col < 0) return 0

    let savedVal = memo[row][col];
    if (savedVal !== null) return savedVal;

    let top = calc(row - 1, col);
    let left = calc(row, col - 1);
    let result = Math.max(top, left) + grid[row][col];

    memo[row][col] = result;
    return result;
  }

  return calc(grid.length - 1, grid[0].length - 1);
}

// iterative version
// function maxTreasure(grid) {
//   let memo = new Array(grid.length).fill(null).map(el => {
//     return new Array(grid[0].length)
//   });

//   // top left 
//   memo[0][0] = grid[0][0];

//   // top row
//   for (let idx = 1; idx < grid[0].length; idx++) {
//     memo[0][idx] = memo[0][idx - 1] + grid[0][idx];
//   }

//   // left col
//   for (let idx = 1; idx < grid.length; idx++) {
//     memo[idx][0] = memo[idx - 1][0] + grid[idx][0];
//   }

//   // remainder
//   for (let row = 1; row < grid.length; row++) {
//     for (let col = 1; col < grid[0].length; col++) {
//       let max = Math.max(memo[row][col - 1], memo[row - 1][col]);
//       memo[row][col] = grid[row][col] + max;
//     }
//   }

//   return memo[memo.length - 1][memo[0].length - 1]
// }

// Test cases
const grid1 = [[7]];
const grid2 = [[1, 3], [2, 4]];
const grid3 = [
  [1, 3, 1, 5],
  [2, 2, 4, 1],
  [5, 0, 2, 3],
  [0, 6, 1, 2]
];

const grid4 = [
  [1, 2, 3, 4, 5],
  [6, 7, 8, 9, 10],
  [11, 12, 13, 14, 15],
  [16, 17, 18, 19, 20],
  [21, 22, 23, 24, 25]
];

const grid5 = [
  [1, 1, 1, 1, 1, 1],
  [1, 2, 2, 2, 2, 1],
  [1, 2, 3, 3, 2, 1],
  [1, 2, 3, 3, 2, 1],
  [1, 2, 2, 2, 2, 1],
  [1, 1, 1, 1, 1, 1]
];

const largeGrid = Array(200).fill().map(() => Array(200).fill(1));

console.log(maxTreasure(grid1) === 7);
console.log(maxTreasure(grid2) === 8);
console.log(maxTreasure(grid3) === 17);
console.log(maxTreasure(grid4) === 149);
console.log(maxTreasure(grid5) === 21);
// The test case below should time out with a brute force approach.
console.log(maxTreasure(largeGrid) === 399);

// All test cases should log true