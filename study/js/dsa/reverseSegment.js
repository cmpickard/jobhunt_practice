// Write a function `reverseSegment` that reverses a segment
// of a singly linked list between two given positions,
// `start` and `end`. The function should take the head of
// the linked list and two integers, `start` and `end`, as
// input and return the modified list.

// The positions `start` and `end` are 1-indexed, and `start`
// is guaranteed to be less than or equal to `end`.

// The list is guaranteed to have at least one node, and `start`
// and `end` are guaranteed to be within the bounds of the list.

// Example:
// Input: head = [1, 3, 5, 7, 9], start = 2, end = 4
// Output: [1, 7, 5, 3, 9]
// Explanation: The segment from position 2 to 4 (3 -> 5 -> 7)
//              is reversed to (7 -> 5 -> 3).

class ListNode {
  constructor(val = 0, next = null) {
    this.val = val;
    this.next = next;
  }
}

function printLinkedList(head) {
  let currentNode = head;
  let listStr = '';
  while (currentNode !== null) {
    listStr += currentNode.val + ' -> ';
    currentNode = currentNode.next;
  }
  listStr += 'null';
  console.log(listStr);
}

function createLinkedList(arr) {
  let head = new ListNode(0);
  let current = head;
  arr.forEach(val => {
    current.next = new ListNode(val);
    current = current.next;
  });
  return head.next;
}

function reverseList(head) {
  if (!head) return null;

  let prev = null;
  let curr = head;
  let next = head.next;

  while (curr.next) {
    curr.next = prev;
    prev = curr;
    curr = next;
    next = curr.next;
  }

  curr.next = prev;

  return curr;
}

function reverseSegment(head, start, end) {
  let count = 1;
  let curr = head;
  let prev = null;
  
  // move prev and curr to beginning of seg
  while (count < start) {
    prev = curr;
    curr = curr.next;
    count++;
  }

  let segStart = curr;

  // move curr to end of seg, then incise seg out of list
  while (curr && count < end)  {
    curr = curr.next
    count++;
  }

  let segEnd = curr;
  curr = curr.next;
  segEnd.next = null;

  let newSeg = reverseList(segStart)

  // attach head of newSeg to first cut point
  if (prev !== null) {
    prev.next = newSeg;
  } else {
    head = newSeg;
  }

  // move prev down to the end of newSeg
  while (prev && prev.next !== null) {
    prev = prev.next;
  }

  // attach end of newSeg to second cut point
  if (prev && curr) prev.next = curr;

  return head;
}

let list1 = createLinkedList([1, 3, 5, 7, 9]);
let list2 = createLinkedList([1, 2, 3]);
let list3 = createLinkedList([1]);
let list4 = createLinkedList([1, 2, 3, 4, 5, 6]);
let list5 = createLinkedList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

printLinkedList(reverseSegment(list1, 2, 4)); // Expected: 1 -> 7 -> 5 -> 3 -> 9 -> null
printLinkedList(reverseSegment(list2, 1, 3)); // Expected: 3 -> 2 -> 1 -> null
printLinkedList(reverseSegment(list3, 1, 1)); // Expected: 1 -> null
printLinkedList(reverseSegment(list4, 3, 5)); // Expected: 1 -> 2 -> 5 -> 4 -> 3 -> 6 -> null
printLinkedList(reverseSegment(list5, 4, 7)); // Expected: 1 -> 2 -> 3 -> 7 -> 6 -> 5 -> 4 -> 8 -> 9 -> 10 -> null