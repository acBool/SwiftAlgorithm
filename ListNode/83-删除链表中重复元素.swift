/*
 删除排序链表中重复元素
 思路：
 题目比较简单，从前往后遍历就可以。比较后一个结点的值和前一个结点的值是否相等就可以
 
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var preNode = head, nextNode = head?.next
        while nextNode != nil {
            if nextNode!.val == preNode!.val {
                preNode?.next = nextNode?.next
                nextNode = nextNode?.next
            }else{
                preNode = nextNode
                nextNode = nextNode?.next
            }
        }
        return head
    }
}
