/*
 移除链表中值=val的结点
 注意：
 1. 可能会移除多个结点
 2. 考虑头结点的移除
 
 思路：
 1. 首先找到新的头结点，while循环
 2. 从新的头结点开始向后遍历，可能存在多个连续的结点需要删除，注意这种情况
 
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        // 先找到新的头结点
        var tmpHead = head
        while tmpHead != nil  && tmpHead!.val == val{
            // 头结点的值和val相等
            tmpHead = tmpHead?.next
        }
        
        var tmpNode = tmpHead?.next,preNode = tmpHead
        
        while tmpNode != nil {
            if tmpNode!.val == val{
                preNode?.next = tmpNode?.next
                // 注意，这种情况下不需要更新preNode
                tmpNode = tmpNode?.next
            }else{
                preNode = tmpNode
                tmpNode = tmpNode?.next
            }
        }
        return tmpHead
    }
}
