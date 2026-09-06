// Implement a recursive function that reverses a given string.
// The function should take a string as input and return its reverse.
// For example, if the input is "hello", the function should return
// "olleh". Solve the problem using recursion.

function reverseString(str) {
  if (str.length <= 1) return str;
  
  return str.slice(-1) + reverseString(str.slice(0,-1));
}


// Example test cases:
console.log(reverseString("hello") === "olleh");
console.log(reverseString("world") === "dlrow");
console.log(reverseString("a") === "a");
console.log(reverseString("") === "");
console.log(reverseString("recursion") === "noisrucer");