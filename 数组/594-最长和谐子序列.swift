/*
 594-最长和谐子序列
 这道题不要想的太复杂，因为和谐子序列的要求是最大元素、最小元素差值为1
 因此，如果num在序列中，那么剩下的序列只能是num-1(num+1也可以，但是num+1、num、num-1不能同时存在)
 根据此思路，可以统计每个数出现的次数，然后比较最大值即可
 
 */
class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        var dict: [Int:Int] = [:]
        for num in nums {
            if let value = dict[num]{
                dict[num] = value + 1
            }else{
                dict[num] = 1
            }
        }
        var ans = 0
        for num in nums {
            if dict.keys.contains(num - 1) {
                ans = max(ans,dict[num]! + dict[num - 1]!)
            }
        }
        return ans
    }
}
