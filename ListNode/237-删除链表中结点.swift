/*
 删除链表中的结点
 
 这道题只有一个参数，就是要删除的结点。通常来说，要删除链表中的结点，需要有头结点、要删除的结点
 但是这道题只有要删除的结点，也就找不到该结点的前一个结点，所以不能用常规方法
 
 这道题更类似于脑筋急转弯。因为得不到前一个结点，所以只能用后面的结点覆盖要删除的结点，见下面代码
 
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
    func deleteNode(_ node: ListNode?) {
        node!.val = node!.next!.val
        node?.next = node?.next?.next
    }
}
