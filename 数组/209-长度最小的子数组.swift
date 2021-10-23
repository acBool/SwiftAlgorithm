/*
 209-长度最小的子数组
 解析： 滑动窗口法。定义一个数组窗口，窗口中的值和小于target
 当窗口值的和+num >= target时，对数组窗口中的值进行删除
 和3-无重复字符的最长子串 这道题非常像
 
 */
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var minLength = Int.max
        var sum: Int = 0
        var array:[Int] = []
        
        for num in nums {
            sum += num
            array.append(num)
            while sum >= target {
                minLength = min(minLength,array.count)
                let value = array.remove(at: 0)
                sum -= value
            }
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}

// 测试用例
var solution = Solution()
print(solution.minSubArrayLen(7, [2,3,1,2,4,3]))
print(solution.minSubArrayLen(4, [1,4,4]))
print(solution.minSubArrayLen(11, [1,1,1]))
