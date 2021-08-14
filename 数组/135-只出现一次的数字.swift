/*
 只出现一次的数字
 思路：
 如果某个数字出现两次，那么其异或结果一定是0.因此，将所有的数异或，最后的值就是出现一次的数
 
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var value = 0
        
        for index in 0...nums.count - 1 {
            value = value ^ nums[index]
        }
        
        return value
    }
}
