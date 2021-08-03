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
class CQueue {

    // Swift中没有栈，因此使用数组模拟栈
    var stack1: [Int] = []
    var stack2: [Int] = []
    
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        stack1.insert(value, at: 0)
    }
    
    func deleteHead() -> Int {
        if stack2.count == 0 {
            while stack1.count > 0 {
                let val = stack1.first!
                stack2.insert(val, at: 0) // 栈只能在栈顶加元素
                stack1.remove(at: 0)
            }
        }
        // stack2负责删除
        if stack2.count > 0 {
            let val = stack2.first!
            stack2.remove(at: 0)
            // 返回stack2的栈顶元素
            return val
        }
        return -1
    }
}