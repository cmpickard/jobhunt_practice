// You are given a sentence represented by a string str. Your objective is to
// reverse all the characters in each word of the sentence while ensuring that
// the case of each character remains unchanged. The spaces between words should
// be preserved as they are, and the overall order of the words in the sentence
// must not be altered.

// You should solve the problem without using the Array.prototype.reverse method.

// Example test cases:
// console.log(reverseWords("Hello World") === "olleH dlroW");
// console.log(reverseWords("JavaScript is fun") === "tpircSavaJ si nuf");
// console.log(reverseWords("Coding in the sun") === "gnidoC ni eht nus");
// console.log(reverseWords("Launch School") === "hcnuaL loohcS");

function reverseWords(str) {
  let words = str.split(' ');

  let reverseArr = words.map(word => {
    let reversed = new Array(word.length).fill(null)
    let end = word.length - 1
    let start = 0

    while (end >= start) {
      reversed[end] = word[start];
      reversed[start] = word[end];
      start++;
      end--;
    }

    return reversed.join('');
  })

  return reverseArr.join(' ');
}

console.log(reverseWords("Hello World") === "olleH dlroW");
console.log(reverseWords("JavaScript is fun") === "tpircSavaJ si nuf");
console.log(reverseWords("Coding in the sun") === "gnidoC ni eht nus");
console.log(reverseWords("Launch School") === "hcnuaL loohcS");
