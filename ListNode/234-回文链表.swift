/*
 判断一个链表是否是回文链表
 思路很简单：
 1. 首先遍历链表，将链表元素的值添加到一个数组中
 2. 遍历数组，判断数组首尾元素是否相等
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        if head?.next == nil {
            return true
        }
        var elementArray: [Int] = []
        var beginNode = head
        while beginNode != nil {
            elementArray.append(beginNode!.val)
            beginNode = beginNode?.next
        }
        
        var i = 0,j = elementArray.count - 1
        while i < j {
            let left = elementArray[i]
            let right = elementArray[j]
            if left != right {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}

// 测试用例
var oneNode = ListNode(1)
var twoNode = ListNode(2)
var threeNode = ListNode(0)
var fourNode = ListNode(2)
var fiveNode = ListNode(1)
oneNode.next = twoNode
twoNode.next = threeNode
threeNode.next = fourNode
fourNode.next = fiveNode

var solution = Solution()
print(solution.isPalindrome(oneNode))