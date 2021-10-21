/*
 268 - 丢失的数字
 没什么难度，直接用公式即可
 
 */
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        let count = nums.count
        let sum = (1 + count) * count / 2
        var missSum = 0
        for value in nums {
            missSum += value
        }
        return sum - missSum
    }
}