// You're given an array, chars, of lowercase English letters sorted in
// ascending order, and a lowercase letter, key. Your task is to find the
// smallest letter in chars that is lexicographically greater than key. If n
//  such letter exists, return the first letter in chars.

// Example test cases:

function findNextLetter(chars, key) {
  let left = 0;
  let right = chars.length - 1;

  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    let curr = chars[mid];
    
    if (curr > key && !(chars[mid - 1] > key)) {
      return curr;
    } else if (curr > key) {
      right = mid - 1;
    } else {
      left = mid + 1
    }
  }

  return chars[0]
}

console.log(findNextLetter(['b', 'd', 'f'], 'a') === 'b');
console.log(findNextLetter(['b', 'd', 'f'], 'c') === 'd');
console.log(findNextLetter(['b', 'd', 'f'], 'f') === 'b');
console.log(findNextLetter(['a', 'a', 'b', 'c'], 'a') === 'b');
console.log(findNextLetter(['c', 'f', 'j'], 'c') === 'f');
console.log(findNextLetter(['a', 'c', 'f', 'h', 'i', 'j'], 'g') === 'h');