/*
 最大子序和
 
 动态规划/贪心
 思路：
 1. 设置一个sums数组，sums[index]表示的是到index为止，能够得到的最大子序和的值
 2. 如果sums[index-1]大于0，那么sums[index] = sums[index-1] + nums[index]
 3. 如果sums[index-1]小于0，那么sums[index] = nums[index]
 
 */
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        
        var sums: [Int] = Array(repeating: 0, count: nums.count)
        sums[0] = nums[0]
        
        var index = 1,maxValue = sums[0]
        while index < nums.count {
            if sums[index - 1] > 0 {
                sums[index] = sums[index - 1] + nums[index]
            }else{
                sums[index] = nums[index]
            }
            if sums[index] > maxValue{
                maxValue = sums[index]
            }
            index += 1
        }
        return maxValue
    }
}
