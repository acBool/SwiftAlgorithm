/*
 二分求平方根
 比较简单，常规的二分。
 唯一需要注意的是，题目要求向下取整。因此最后返回 min(left,right)
 */
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 0, right = x,mid = 0
        while left <= right {
            mid = (left + right) / 2
            let pow = mid * mid
            if pow == x {
                return mid
            }else if pow < x {
                left = mid + 1
            }else {
                right = mid - 1
            }
        }
        return min(left,right)
    }
}

// 测试用例
var solution = Solution()
print(solution.mySqrt(2))
//print(solution.mySqrt(4))
//print(solution.mySqrt(8))
