/*
 从尾到头打印链表
 无难度
 
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
    var ansArray: [Int] = []
    func reversePrint(_ head: ListNode?) -> [Int] {
        var tmpNode = head
        while tmpNode != nil {
            ansArray.insert(tmpNode!.val, at: 0)
            tmpNode = tmpNode?.next
        }
        return ansArray
    }
}
