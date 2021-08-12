/*
 合并两个有序链表
 题目不难，主要是细节
 
 思路：
 1. 因为两个链表本身是有序的，因此同时遍历两个链表结点，并比较就可以了
 2. 在遍历过程中，生成一个新的链表
 3. 注意生成链表时，有preNode，tmpNode
 4. 最后注意可能存在某个链表完了，但是另一个链表还有结点，注意拼接上
 
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        // 两个链表都不为空
        var headA = l1, headB = l2
        var newHead: ListNode? = nil
        var tmpNode: ListNode? = nil
        var preNode: ListNode? = nil
        while headA != nil && headB != nil {
            if headA!.val < headB!.val {
                tmpNode = ListNode(headA!.val,nil)
                headA = headA?.next
            }else{
                tmpNode = ListNode(headB!.val,nil)
                headB = headB?.next
            }
            if newHead == nil {
                newHead = tmpNode
            }else{
                preNode?.next = tmpNode
            }
            preNode = tmpNode
        }
        
        if headA != nil {
            preNode?.next = headA
        }
        if headB != nil {
            preNode?.next = headB
        }
        
        return newHead
    }
}
