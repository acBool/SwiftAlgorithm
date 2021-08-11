/*
 判断两个链表是否有交点
 如果两个链表有交点，那么从交点往后的每个元素都相等
 
 思路：
 1.首先各获取两个链表的长度
 2.如果长度不想等，则移动长链表的头结点，保持两个链表长度相等
 3.开始同时遍历两个链表，找到第一个相同的元素，就是所要找的元素
 
 注意：
 1. 判断两个结点是否相等，用的是 ===
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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        let lenA = self.getListNodeCnt(headA)
        let lenB = self.getListNodeCnt(headB)
        var tmpHeadA = headA, tmpHeadB = headB
        if lenA > lenB {
            self.moveElementByCount(&tmpHeadA, lenA - lenB)
        }else{
            self.moveElementByCount(&tmpHeadB, lenB - lenA)
        }
        
        // 两个长度相等，开始判断
        while tmpHeadA != nil && tmpHeadB != nil {
            if tmpHeadA === tmpHeadB {
                return tmpHeadA
            }
            tmpHeadB = tmpHeadB?.next
            tmpHeadA = tmpHeadA?.next
        }
        
        return nil
    }
    
    func moveElementByCount(_ head: inout ListNode?,_ cnt: Int) {
        if cnt == 0 {
            return
        }
        if head == nil {
            return
        }
        var index = 0
        while index < cnt {
            head = head?.next
            index += 1
        }
    }
    
    func getListNodeCnt(_ head: ListNode?) -> Int {
        if head == nil {
            return 0
        }
        
        var cnt = 0
        var tmpNode = head
        while tmpNode != nil {
            cnt += 1
            tmpNode = tmpNode?.next
        }
        return cnt
    }
}
