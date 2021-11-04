/*
 367-有效的完全平方数
 判断一个数是否是完全平方数，可以用打表法，先算出所有的完全平方数，大概6万多个，然后
 判断给的数字是否在表中即可
 另外可以使用二分查找法来判断
 
 */
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        if num == 1 {
            return true
        }
        
        var right = num / 2, left = 1, mid = 0
        while left <= right {
            mid = (left + right) / 2
            if mid * mid > num {
                right = mid - 1
            }else if mid * mid < num {
                left = mid + 1
            }else{
                return true
            }
        }
        return false
    }
}

// 测试用例
let solution = Solution()
print(solution.isPerfectSquare(16))
print(solution.isPerfectSquare(2))
print(solution.isPerfectSquare(4))
print(solution.isPerfectSquare(14))
