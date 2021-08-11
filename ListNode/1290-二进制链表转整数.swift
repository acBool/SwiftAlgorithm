/*
 二进制链表转整数
 
 首先遍历所有链表结点，添加到一个数组中（添加的时候可以往头部加结点）
 然后再计算即可，比较简单
 
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
    var valArray: [Int] = []
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        if head == nil {
            return 0
        }
        
        var tmpNode = head
        while  tmpNode != nil {
            valArray.insert(tmpNode!.val, at: 0)
            tmpNode = tmpNode?.next
        }
        
        var sum = 0
        var pow = 1
        var index = 0
        while index < valArray.count {
            var val = valArray[index]
            if index == 0 {
                sum += val
            }else {
                pow = pow * 2
                val = val * pow
                sum += val
            }
            index += 1
        }
        return sum
    }
}
