/*
 字符串中的第一个唯一字符
 题目没什么难度，用字典计数就可以
 
 */
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        if s.count == 0 {
            return -1
        }
        
        var dict: [Character: Int] = [:]
        var array: [Character] = Array(s)
        for char in array {
            if dict[char] == nil {
                dict[char] = 1
            }else{
                dict[char] = dict[char]! + 1
            }
        }
        for index in 0...array.count - 1 {
            let char = array[index]
            if dict[char]! == 1 {
                return index
            }
        }
        
        return -1
    }
}
