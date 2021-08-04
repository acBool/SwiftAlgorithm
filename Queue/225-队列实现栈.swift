/*
 用队列实现栈
 队列是先进先出的，只能往队列尾部添加元素
 栈是先进后出的，删除元素时，删除的是栈顶元素
 Swift中没有队列，因此使用数组来模拟队列
 思路：
 由于队列只能在尾部添加元素，因此在获得栈顶元素时，只能将队列中的前 n-1 个元素移动到另一个队列，n为队列的元素总个数
 队列中剩下的1个元素即为栈顶元素
 
 再次获得栈顶元素时，需要将另一个队列中的前 n-1 个元素移动到原队列，剩下的1个元素即为栈顶元素
 
 实现就是再两个队列中来回移动前 n-1 个元素
 */
class MyStack {

    var queue1: [Int] = []
    var queue2: [Int] = []
    var topIndex = 0
    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        // 队列只能在尾部添加元素
        if queue1.count == 0 && queue2.count == 0 {
            // 如果都为空，随便在一个队列中添加元素就可以
            queue1.append(x)
            topIndex = 1
        }else if queue1.count == 0 {
            // 在队列2中添加元素
            queue2.append(x)
        }else if queue2.count == 0 {
            // 在队列1中添加元素
            queue1.append(x)
        }else {
            // 队列1、队列2都不为空
            // 在栈顶元素所在的队列中添加元素
            if topIndex == 1 {
                queue1.append(x)
            }else {
                queue2.append(x)
            }
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return changeElement(isPop: true)
    }
    
    /** Get the top element. */
    func top() -> Int {
        return changeElement(isPop: false)
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue1.count == 0 && queue2.count == 0
    }
    
    // 将队列1的元素加入到队列2中
    func addElementFromQ1ToQ2() {
        while queue1.count > 1 {
            let val = queue1.first!
            queue2.append(val)
            queue1.remove(at: 0)
        }
    }
    
    // 将队列2中的元素加入到队列1中
    func addElementFromQ2ToQ1() {
        while queue2.count > 1 {
            let val = queue2.first!
            queue1.append(val)
            queue2.remove(at: 0)
        }
    }
    
    func changeElement(isPop: Bool) -> Int {
        if queue1.count == 0 && queue2.count == 0 {
            return -1
        }
        
        if queue2.count == 0 {
            // 将Q1中的元素转移到Q2中
            addElementFromQ1ToQ2()
            let ans = queue1.first!
            if isPop {
                queue1.remove(at: 0)
            }else {
                topIndex = 1
            }
            return ans
        }
        
        if queue1.count == 0 {
            // 将Q2中的元素转移到Q1中
            addElementFromQ2ToQ1()
            let ans = queue2.first!
            if isPop {
                queue2.remove(at: 0)
            }else {
                topIndex = 2
            }
            return ans
        }
        
        // 两个队列都不为空
        if topIndex == 1 {
            // 栈顶元素在队列1
            // 需要将队列1中的元素加入到队列2中
            addElementFromQ1ToQ2()
            let ans = queue1.first!
            if isPop {
                queue1.remove(at: 0)
            }
            return ans
        }else if topIndex == 2 {
            // 栈顶元素在队列2
            // 需要将队列2中的元素加入到队列1中
            addElementFromQ2ToQ1()
            let ans = queue2.first!
            if isPop {
                queue2.remove(at: 0)
            }
            return ans
        }
        
        return -1
    }
}
