/*
 反转字符串
 题目给的就是字符数组，方便操作
 不能开辟额外的数组空间，因此采取交换的方式
 第一个元素和最后一个交换；第二个和倒数第二个交换……
 
 注意：
 长度为0和长度为1的情况
 */
class Solution {
    func reverseString(_ s: inout [Character]) {
        if s.count == 0 || s.count == 1 {
            return
        }
        let length = s.count
        for i in 0...length/2 - 1 {
            let rightIndex = length - 1 - i
            let lc = s[i]
            let rc = s[rightIndex]
            s[i] = rc
            s[rightIndex] = lc
        }
    }
}

// 测试用例
var solution = Solution()
var array: [Character] = ["h","e","l","l","o"]
solution.reverseString(&array)
