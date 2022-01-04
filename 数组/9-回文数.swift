/*
 9 - 回文数
 题目比较简单，使用字符串+双指针非常容易
 如果不使用字符串，仅仅用整数也可以
 思路就是：正着看的数 = 倒着看的数
 倒着看的数需要计算，每次乘10 + 取余的数就可以
 
 */
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x == 0 {
            return true
        }
        
        var reverseValue = 0,value = x
        while value > 0 {
            let tmp = value % 10
            value = value / 10
            reverseValue = reverseValue * 10 + tmp
        }
        return reverseValue == x
    }
}


// 测试用例
var solution = Solution()
print(solution.isPalindrome(123))
print(solution.isPalindrome(121))
