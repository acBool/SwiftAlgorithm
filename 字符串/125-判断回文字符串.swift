/*
 判断回文字符串
 
 思路：
 题目比较简单，主要是注意String相关的api
 1. 首先过滤非法字符，将所有合法的字符放到一个数组中
 2. 遍历数组，第一个元素和最后一个元素相同，第二个元素和倒数第二个元素相同……
 3. 不满足，返回false；全部满足，返回true
 
 */
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        // 处理空串和长度为1的串
        if s.count < 2 {
            return true
        }
        
        var ansArray: [Character] = []
        let lowerS = s.lowercased()
        for char in lowerS {
            // 过滤非法字符
            if (char >= "0" && char <= "9") || (char >= "a" && char <= "z") {
                ansArray.append(char)
            }
        }
        
        if ansArray.count < 2 {
            return true
        }
        
        for index in 0...ansArray.count-1 {
            let rightValue = ansArray.count - 1 - index
            if index >= rightValue {
                break
            }
            if ansArray[index] != ansArray[rightValue] {
                return false
            }
        }
        
        return true
    }
}