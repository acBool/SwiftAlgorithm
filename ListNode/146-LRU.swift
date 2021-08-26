/*
 LRU
 使用双向链表+字典实现
 注意：添加元素后要判断是否删除
 获取元素后，要将结点移动到头部
 更新元素后，要将结点移动到头部
 
 */
class ListNode {
    var key: Int
    var value: Int
    var prev: ListNode?
    var next: ListNode?
    
    init() {
        self.key = 0
        self.value = 0
        self.prev = nil
        self.next = nil
    }
}

class LRUCache {
    var dict: [Int:ListNode] = [:]
    var maxCount: Int
    var currentCount: Int
    var headNode: ListNode?
    var tailNode: ListNode?
    
    init() {
        self.maxCount = 0
        self.currentCount = 0
        self.headNode = nil
        self.tailNode = nil
    }
    
    init(_ capacity: Int) {
        self.maxCount = capacity
        self.currentCount = 0
        self.headNode = nil
        self.tailNode = nil
    }
    
    func get(_ key: Int) -> Int {
        let node = dict[key]
        if node == nil {
            return -1
        }
        // 应该将该结点放到头部,且此时一定有head
        self.moveNodeToHead(node)
        return node!.value
    }
    
    // 添加、更新
    func put(_ key: Int, _ value: Int) {
        var node = dict[key]
        if node == nil {
            // 不存在，添加
            node = ListNode()
            node?.value = value
            node?.key = key
            dict[key] = node
            // 放到头部
            if self.headNode == nil {
                self.headNode = node
                self.tailNode = node
            }else{
                self.headNode?.prev = node
                node?.next = self.headNode
                self.headNode = node
            }
            self.currentCount += 1
            // 这里应该判断删除
            self.deleteNode()
        }else{
            // 存在
            node!.value = value
            self.moveNodeToHead(node)
        }
    }
    
    func moveNodeToHead(_ node: ListNode?) {
        // 首先判断本身是不是head
        if node!.key == self.headNode!.key {
            return
        }
        
        if node!.key == self.tailNode!.key {
            self.tailNode = node?.prev
        }
        
        // 删除node结点
        node?.next?.prev = node?.prev
        node?.prev?.next = node?.next
        node?.prev = nil
        node?.next = self.headNode
        self.headNode?.prev = node
        self.headNode = node
    }
    
    func deleteNode() {
        while self.currentCount > self.maxCount {
            // 从尾部删除
            let oldTail = self.tailNode
            self.tailNode = self.tailNode?.prev
            self.tailNode?.next = nil
            oldTail?.next = nil
            oldTail?.prev = nil
            self.dict.removeValue(forKey: oldTail!.key)
            self.currentCount -= 1
        }
    }
}
