/*
 19 - 删除链表的倒数第N个结点
 题目不难，主要是注意一些边界情况处理
 还有就是，如果删除的是头结点，当链表长度大于1时，需要返回第二个结点（本题仅删除1个结点，而
 不是把该结点后面的所有结点都删除）
 
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        let length = calculateListLength(head)
        let beforeNode = length - n
        if beforeNode <= 0 {
            if length == 1 {
                return nil
            }else {
                // 删除倒数第n个结点，如果删除的是头结点，且链表长度大于1，那么需要返回第二个结点
                return head?.next
            }
        }
        var cnt = 1
        var node = head
        while node != nil {
            if cnt >= beforeNode {
                break
            }
            cnt += 1
            node = node?.next
        }
        var tmpNode = node?.next?.next
        node?.next = tmpNode
        
        return head
    }
    
    
    func calculateListLength(_ head: ListNode?) -> Int {
        var cnt = 0
        
        var node = head
        while node != nil {
            cnt += 1
            node = node?.next
        }
        
        return cnt
    }
}
