/*
 反转链表
 
 思路：找到连续的两个链表，把后面链表的next指向前面，循环操作
 注意：
 1. head为nil 以及 head.next为nil
 2. 将原head的next指向nil
 
 */
class ListNode {
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var preNode = head, current = head?.next
        preNode?.next = nil
        while current != nil {
            let tmpNode = current?.next
            current?.next = preNode
            preNode = current
            current = tmpNode
        }
        return preNode
    }
}
