/*
 用两个栈模拟一个队列
 栈的特点是先进后出，添加元素只能加在栈头
 队列的特点是先进先出
 思路：
 一个栈用于添加元素，一个栈用于删除元素
 添加时，直接在栈顶加元素即可
 删除时，如果删除栈中无元素，则需要将添加栈中的所有元素加入到删除栈中；
 如果删除栈中有元素，则直接返回栈顶元素即可
 */
class MyQueue {

    var stack1: [Int] = []
    var stack2: [Int] = []
    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack1.insert(x, at: 0)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        self.addElementFromStackOne()
        // stack2负责删除
        if stack2.count > 0 {
            let val = stack2.first!
            stack2.remove(at: 0)
            // 返回stack2的栈顶元素
            return val
        }
        return -1
    }
    
    /** Get the front element. */
    func peek() -> Int {
        self.addElementFromStackOne()
        if stack2.count > 0 {
            let val = stack2.first!
            // 返回stack2的栈顶元素
            return val
        }
        return -1
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack1.count == 0 && stack2.count == 0
    }
    
    func addElementFromStackOne() {
        if stack2.count == 0 {
            while stack1.count > 0 {
                let val = stack1.first!
                stack2.insert(val, at: 0) // 栈只能在栈顶加元素
                stack1.remove(at: 0)
            }
        }
    }
}
