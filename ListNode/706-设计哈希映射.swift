/*
 设计哈希映射
 
 和之前的一道设计哈希表非常类似，唯一不同的地方在于，链表结点需要保存key/value
 思路都是一致的，结合 设计哈希集合  一起看
 
 */
class ListNode {
    var key: Int
    var val: Int
    var next: ListNode?

    init() {
        self.key = -1
        self.val = -1
        self.next = nil
    }

    init(_ key: Int,_ val: Int, _ next: ListNode?) {
        self.key = key
        self.val = val
        self.next = next
    }
}

class OperateListNode {
    
    func getNodeValueWithKey(_ head: ListNode?, _ key: Int) -> Int{
        if head == nil {
            return -1
        }
        
        var tmpNode = head
        while tmpNode != nil {
            let tmpKey = tmpNode!.key
            if tmpKey == key {
                return tmpNode!.val
            }
            tmpNode = tmpNode?.next
        }
        
        return -1
    }
    
    func addValueToHead(_ head: inout ListNode?, _ key: Int, _ val: Int){
        let node = ListNode(key,val,nil)
        if head == nil {
            head = node
        }else{
            // head不为空，将node结点插入在头部
            node.next = head
            head = node
        }
    }

    func removeValueFromList(_ head: inout ListNode?, _ val: Int) {
        if head == nil {
            return
        }

        // 删除的是头结点
        if head!.key == val {
            if head?.next == nil {
                // 只有一个头结点
                head = nil
            }else{
                // 使用后一个结点覆盖
                head!.key = head!.next!.key
                head!.val = head!.next!.val
                head?.next = head?.next?.next
            }
        }else{
            // 需要找到对应的结点
            var preNode = head
            var nextNode = head?.next
            while nextNode != nil {
                if nextNode!.key == val {
                    preNode?.next = nextNode?.next
                    break
                }
                preNode = nextNode
                nextNode = nextNode?.next
            }
        }
    }


    func containsValInList(_ head: ListNode?, _ key: Int, _ val: Int) -> Bool {
        if head == nil {
            return false
        }

        var tmp = head
        while tmp != nil {
            if tmp!.key == key {
                tmp!.val = val
                return true
            }
            tmp = tmp?.next
        }
        return false
    }
}


class MyHashMap {
    // 数组，数组中存放的是链表结点。实际上，每个链表结点都是一个链表的头结点
    var listArray: [ListNode?] = Array(repeating: nil, count: 101)
    // 设置一个质数，加入集合中的每个数对该质数取余。同时，listArray的容量也是这么大
    let primeNum = 101
    var operateListNode = OperateListNode()

    func put(_ key: Int, _ value: Int) {
        
        if self.update(key, value) == false {
            let index = key % primeNum
            var head = listArray[index]
            self.operateListNode.addValueToHead(&head, key, value)
            listArray[index] = head
        }
    }
    
    func remove(_ key: Int) {
        let index = key % primeNum
        var head = listArray[index]
        self.operateListNode.removeValueFromList(&head, key)
        listArray[index] = head
    }
    
    func get(_ key: Int) -> Int {
        let index = key % primeNum
        let head = listArray[index]
        return self.operateListNode.getNodeValueWithKey(head, key)
    }
    
    func update(_ key: Int, _ val: Int) -> Bool {
        let index = key % primeNum
        let head = listArray[index]
        return self.operateListNode.containsValInList(head, key,val)
    }
    
}

// 测试用例
var hashMap = MyHashMap()
hashMap.put(1, 1)
print(hashMap.get(1))

hashMap.put(1,2)
print(hashMap.get(1))

hashMap.put(102,1)
print(hashMap.get(1))
print(hashMap.get(102))

