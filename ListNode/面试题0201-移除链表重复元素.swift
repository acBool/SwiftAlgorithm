/*
 移除链表重复结点
 注意这道题和“移除有序链表重复结点”的区别
 
 因为这道题链表是无序的，因此只和前一个链表比较不行。需要将链表的值都存下来，
 判断值是否出现过。采用的存储方式是字典
 
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
    
    var valueDict: [Int:Int] = [:]
    
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var preNode = head,nextNode = head?.next
        valueDict[preNode!.val] = 1
        while nextNode != nil {
            let key = nextNode!.val
            if valueDict.keys.contains(key){
                // 已经有相同元素
                preNode?.next = nextNode?.next
                nextNode = nextNode?.next
            }else{
                // 无相同元素，添加到字典中
                valueDict[nextNode!.val] = 1
                preNode = nextNode
                nextNode = nextNode?.next
            }
        }
        
        return head
    }
}
