/*
 链表的中间结点
 思路：
 1. 首先获取到链表的总个数
 2. 再遍历链表，获取到中间值
 这样需要循环两次
 
 网上看到了另外一种思路，使用快慢指针
 快指针每次移动两个，慢指针每次移动1个，快指针走到尾部的时候，慢指针就是所要找的元素
 只需要循环一次
 
 */
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(){
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

//class Solution {
//    func middleNode(_ head: ListNode?) -> ListNode? {
//        if head == nil {
//            return head
//        }
//
//        var cnt = 1
//        var tmpNode = head
//        while tmpNode?.next != nil {
//            cnt += 1
//            tmpNode = tmpNode?.next
//        }
//        var index = 0
//        let mid = cnt / 2
//        tmpNode = head
//        while index < mid {
//            tmpNode = tmpNode?.next
//            index += 1
//        }
//        return tmpNode
//    }
//}


class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var slow = head
        var fast = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}


// 测试用例
var sixNode = ListNode(6,nil)
var fiveNode = ListNode(5,sixNode)
var fourNode = ListNode(4,fiveNode)
var threeNode = ListNode(3,fourNode)
var twoNode = ListNode(2,threeNode)
var oneNode = ListNode(1,twoNode)

var solution = Solution()
solution.middleNode(oneNode)

solution.middleNode(twoNode)
