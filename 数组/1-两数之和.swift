/*
 两数之和
 思路：
 用暴力法，也就是两重for循环肯定可以解决，不过比较耗时
 另外一种思路就是用字典，字典实际上是哈希，查找时能够提升效率
 
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for (index,val) in nums.enumerated() {
            var diff = target - val
            if dict.keys.contains(diff) {
                return [index,dict[diff]!]
            }
            dict[val] = index
        }
        return []
    }
}