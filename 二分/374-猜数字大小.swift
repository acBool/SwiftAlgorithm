/*
 题意比较晦涩，但实质上就是一个普通的二分查找
 另外要注意的是，提交代码中不需要实现guess函数，只提交guessNumber相关的代码即可
 
 */

// 为了编译通过，我把guess函数也写上了
func guess(_ num: Int) -> Int {
    return -1
}

class Solution {
    func guessNumber(_ n: Int) -> Int {
        var left = 1, right = n, mid = 0
        while (left <= right) {
            mid = (left + right) / 2
            let ans = guess(mid)
            if ans == -1 {
                right = mid - 1
            }else if ans == 1 {
                left = mid + 1
            }else{
                return mid
            }
        }
        return mid
    }
}
