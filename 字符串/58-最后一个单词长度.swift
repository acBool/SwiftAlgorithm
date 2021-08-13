/*
 最后一个单词的长度
 思路：
 使用split api可以解决
 如果不能用api，可以考虑倒序遍历
 s.reversed
 
 */
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let array: [Substring] = s.split(separator: " ")
        if array.count == 0 {
            return 0
        }
        
        return array[array.count - 1].count
    }
}
