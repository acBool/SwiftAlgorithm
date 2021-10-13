/*
 判断一个数是否是2的幂，题目简单，可以联系递归
 
 */
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        if n == 1 {
            return true
        }
        let mod = n % 2
        let value = n / 2
        if mod == 1 {
            return false
        }
        return isPowerOfTwo(value)
    }
}

// 测试用例
var solution = Solution()
print(solution.isPowerOfTwo(16))
print(solution.isPowerOfTwo(4))
print(solution.isPowerOfTwo(5))
print(solution.isPowerOfTwo(100000000))
