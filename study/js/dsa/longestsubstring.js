// Write a function `longestSubstringLength` that finds the
// length of the longest substring without duplicates in a
// given string. The function should take a string as input
// and return an integer representing the length of the longest
// substring without any repeating characters. The input
// string will only contain lowercase characters.

// Example:
// Input: s = "helloworld"
// Output: 5
// Explanation: The longest substring without repeating characters is "world",
// which has a length of 5.

// longest = 2
// [h, e ]
// "helloworld"
//  ^ ^
function longestSubstringLength(string) {
  let anchor = 0;
  let runner = 1;
  let longest = 1;
  let seen = [string[anchor]];

  while (anchor < string.length) {
    let curr = string[runner];
    if (seen.includes(curr)) {
      anchor++;
    } else {
      seen.push(curr);
      let len = 1 + runner - anchor;
      if (longest < len) longest = len
      runner++;
    }
  }

  return longest;
}

// console.log(longestSubstringLength("a") === 1);
// console.log(longestSubstringLength("aa") === 1);
// console.log(longestSubstringLength("ab") === 2);
// console.log(longestSubstringLength("abba") === 2);
// console.log(longestSubstringLength("abc") === 3);
console.log(longestSubstringLength("helloworld") === 5);
console.log(longestSubstringLength("dvdf") === 3);
console.log(longestSubstringLength("tmmzuxt") === 5);
console.log(longestSubstringLength("thisishowwedoit") === 6);
console.log(longestSubstringLength("longestsubstring") === 8);
console.log(longestSubstringLength("aabbccddeffghijklmno") === 10);
console.log(longestSubstringLength("abcdefghijklmnopqrstuvwxyz") === 26);