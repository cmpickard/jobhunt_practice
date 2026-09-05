// Given two sorted singly linked lists, your task is to combine them into a
// single sorted linked list. The new list should be composed of the nodes from
// the two original lists and should also be sorted in ascending order (where
//   node values are equal to or increase as you move through the linked list).

function ListNode(val) {
  this.val = val;
  this.next = null;
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
function printLinkedList(head) {
  let current = head;
  let listStr = '';
  while (current !== null) {
    listStr += current.val + ' -> ';
    current = current.next;
  }
  listStr += 'null';
  console.log(listStr);
}

function mergeSortedLists(head1, head2) {
  let [curr1, curr2] = [head1, head2];
  let sortedHead = new ListNode(0);
  let currSorted = sortedHead; 
  
  while (curr1 && curr2) {
    if (curr1.val > curr2.val) {
      currSorted.next = curr2;
      curr2 = curr2.next;
    } else {
      currSorted.next = curr1;
      curr1 = curr1.next;
    }

    currSorted = currSorted.next;
  }

  currSorted.next = curr1 ? curr1 : curr2;
  return sortedHead.next;
}

let list1 = createLinkedList([1, 3, 5]);
let list2 = createLinkedList([2, 4, 6]);
printLinkedList(mergeSortedLists(list1, list2)); // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> null

let list3 = createLinkedList([1, 2, 3]);
let list4 = createLinkedList([]);
printLinkedList(mergeSortedLists(list3, list4)); // Expected: 1 -> 2 -> 3 -> null

let list5 = createLinkedList([]);
let list6 = createLinkedList([1]);
printLinkedList(mergeSortedLists(list5, list6)); // Expected: 1 -> null

let list7 = createLinkedList([1, 5, 9]);
let list8 = createLinkedList([2, 4, 6, 8, 10]);
printLinkedList(mergeSortedLists(list7, list8)); // Expected: 1 -> 2 -> 4 -> 5 -> 6 -> 8 -> 9 -> 10 -> null

let list9 = createLinkedList([1, 2, 5]);
let list10 = createLinkedList([3, 6, 7]);
printLinkedList(mergeSortedLists(list9, list10)); // Expected: 1 -> 2 -> 3 -> 5 -> 6 -> 7 -> null