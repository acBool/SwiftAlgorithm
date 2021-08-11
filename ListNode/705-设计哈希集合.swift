/*
 设计哈希集合，不能使用系统的哈希集合
 哈希表，其本质就是多个数组。常见的哈希表就是取余操作，对取余的数可以设置为一个质数
 另外一个需要考虑的问题就是冲突，哈希不可避免的会有冲突。有冲突的时候，可以使用数组，将冲突的元素都放在一个数组中。
 但是因为不知道冲突的元素有多少个，因此通常使用链表
 
 整个结构是：有一个数组，数组中存放的元素都是链表的头结点。
 假设质数是101，那么数组的空间就是101
 
 添加元素、删除元素、判断元素是否存在时，val都对101取余，在对应的链表中添加、删除、寻找
 
 初始化数组时，用到了一个新的api  Array(repeating: nil, count: 101)
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

class OperateListNode {
    func addValueToTail(_ head: inout ListNode?, _ val: Int) {
        
        let node = ListNode(val,nil)
        // 判断是否是头结点
        if head == nil {
            head = node
        }else{
            var tmpNode = head
            // 找到最后一个结点
            while tmpNode?.next != nil {
                tmpNode = tmpNode?.next
            }
            tmpNode?.next = node
        }
    }
    
    func removeValueFromList(_ head: inout ListNode?, _ val: Int) {
        if head == nil {
            return
        }
        
        // 删除的是头结点
        if head!.val == val {
            if head?.next == nil {
                // 只有一个头结点
                head = nil
            }else{
                // 使用后一个结点覆盖
                head!.val = head!.next!.val
                head?.next = head?.next?.next
            }
        }else{
            // 需要找到对应的结点
            var preNode = head
            var nextNode = head?.next
            while nextNode != nil {
                if nextNode!.val == val {
                    preNode?.next = nextNode?.next
                    break
                }
                preNode = nextNode
                nextNode = nextNode?.next
            }
        }
    }
    
    
    func containsValInList(_ head: ListNode?, _ val: Int) -> Bool {
        if head == nil {
            return false
        }
        
        var tmp = head
        while tmp != nil {
            if tmp!.val == val {
                return true
            }
            tmp = tmp?.next
        }
        
        return false
    }
    
}


class MyHashSet {
    // 数组，数组中存放的是链表结点。实际上，每个链表结点都是一个链表的头结点
    var listArray: [ListNode?] = Array(repeating: nil, count: 101)
    // 设置一个质数，加入集合中的每个数对该质数取余。同时，listArray的容量也是这么大
    let primeNum = 101
    var operateListNode = OperateListNode()
    
    func add(_ key: Int) {
        if self.contains(key){
            return
        }
        
        let index = key % 101
        var head = listArray[index]
        self.operateListNode.addValueToTail(&head, key)
        listArray[index] = head
    }
    
    func remove(_ key: Int) {
        if self.contains(key) {
            let index = key % 101
            var head = listArray[index]
            self.operateListNode.removeValueFromList(&head, key)
            listArray[index] = head
        }
    }
    
    func contains(_ key: Int) -> Bool {
        let index = key % 101
        let head = listArray[index]
        return self.operateListNode.containsValInList(head, key)
    }
}

// 测试用例
var hash = MyHashSet()
hash.add(1)
hash.add(2)
print(hash.contains(1))