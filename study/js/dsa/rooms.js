// Write a function `rooms` that determines the minimum number of
// rooms required to handle a series of interviews given their
// time intervals.

// Each interval is represented as an array [start, end],
// where `start` is the start time and `end` is the end
// time of the interview.

// The function should return the number of conference rooms
// required to ensure no two interviews overlap in the same room.

// Example I:
// Input: intervals = [[20, 25], [10, 15], [0, 25]]
// Output: 2
// Explanation: The first interview is scheduled from
//              time 0 to 25. The second interview is
//              from time 10 to 15 and overlaps with
//              the first interview, requiring a second
//              room. The third interview from 20 to 25
//              also overlaps with the first. Thus, a
//              minimum of two rooms are required.

// Example II:
// Input: intervals = [[5, 9], [1, 3]]
// Output: 1
// Explanation: The first interview is scheduled from
//              time 5 to 9. The second interview is
//              from time 1 to 3. These two interviews
//              do not overlap, therefore only one
//              conference room is needed.

// Test Cases:
// [1, 4], [2, 5], [3, 6]
// {1: 1, 2: 1, 3: 1, 4: 1}
// {1: 1, 2: 2, 3: 2, 4: 2, 5: 1}
// {1: 1, 2: 2, 3: 3, 4: 3, 5: 2, 6: 1}

// [1,2,3] & [4,5,6]

// [1,3,6] & [3,6,8]

// [0,1,2,4,5,8] & [3,5,6,7,9,10]
//          ^         ^
// 1
// 
function rooms(intervals) {
  let starts = intervals.map(int => int[0]).sort();
  let ends = intervals.map(int => int[1]).sort();
  let currStart = 0;
  let currEnd = 0;
  let roomsInUse = 0;
  let maxRoomsInUse = -Infinity;

  while (currStart < starts.length) {
    let currTime = starts[currStart];
    if (currTime < ends[currEnd]) {
      roomsInUse++;
      maxRoomsInUse = roomsInUse > maxRoomsInUse ? roomsInUse : maxRoomsInUse;
    } else if (currTime >= ends[currEnd]) {
      currEnd++;
    }
  }

  return maxRoomsInUse;
}

console.log(rooms([[20, 25], [10, 15], [0, 25]]) === 2);
console.log(rooms([[5, 9], [1, 3]]) === 1);
console.log(rooms([[1, 2], [3, 4], [5, 6]]) === 1);
console.log(rooms([[1, 4], [2, 5], [3, 6]]) === 3);
console.log(rooms([[1, 3], [3, 6], [6, 8]]) === 1);
console.log(rooms([[1, 10]]) === 1);
console.log(rooms([[1, 3], [2, 4], [4, 6]]) === 2);
console.log(rooms([[1, 5], [2, 3], [4, 6], [5, 7]]) === 2);
console.log(rooms([[0, 5], [1, 3], [2, 6], [4, 7], [5, 9], [8, 10]]) === 3);
console.log(rooms([[1, 2], [2, 3], [3, 4], [4, 5]]) === 1);
console.log(rooms([[1, 20], [5, 10], [11, 15], [16, 18]]) === 2);
console.log(rooms([[1, 4], [1, 3], [1, 2], [1, 5]]) === 4);
// All test cases should log true