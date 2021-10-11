/*
 位1的个数
 1. 可以不断的对2取余、除以2来计算
 2. 也可以和1&&运算，然后左移，实际上和法1一样
 
 */
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var ans:Int = 0
        var value = n
        while value > 0 {
            let mod = value % 2
            value = value / 2
            ans = ans + (mod == 1 ? 1 : 0)
        }
        
        return ans
    }
}