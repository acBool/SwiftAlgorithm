/*
 链表中倒数第k个结点
 题目比较简单，可以遍历链表，将链表结点存到一个数组中，然后直接返回对应结点就可以
 
 还可以使用快慢指针的方法。快指针先移动k个结点，然后快慢指针同时移动。快指针指向nil时，慢指针就是所求的值
 
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
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k == 0 {
            return nil
        }
        
        var nodeArray: [ListNode?] = []
        var tmpNode = head
        while tmpNode != nil {
            nodeArray.insert(tmpNode, at: 0)
            tmpNode = tmpNode?.next
        }
        
        if k > nodeArray.count {
            return nil
        }
        return nodeArray[k - 1]
    }
}
