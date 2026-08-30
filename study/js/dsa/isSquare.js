// Write a function that checks whether a given positive integer num is the
// result of an integer multiplied by itself, which is typically referred to
// as a square integer. The function should return true if num is a square
// integer, otherwise false. The implementation should not rely on any square
// root computation provided by built-in Math library.

function isSquareInteger(int) {
  let left = 0
  let right = Math.floor(int / 2)

  if (left === right) return true

  while (left <= right) {
    let mid = Math.floor((left + right)/ 2)
    let squareMid = mid * mid;
    if (squareMid === int) {
      return true
    } else if (squareMid > int) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }

  return false;
}

console.log(isSquareInteger(1) === true);
console.log(isSquareInteger(4) === true);
console.log(isSquareInteger(16) === true);
console.log(isSquareInteger(14) === false);
console.log(isSquareInteger(25) === true);
console.log(isSquareInteger(26) === false);