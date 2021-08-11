/*
 判断链表是否有环
 思路：使用快指针、慢指针。快指针每次向后移动两次，慢指针每次向后移动一次
 如果快、慢指针指向的结点相同，说明有环；否则无环
 
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

class Solution{
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        var slow = head?.next, fast = head?.next?.next
        while slow != nil && fast != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}
