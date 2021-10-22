/*
 229 - 求众数
 使用字典统计出每个数出现的次数，然后再判断是否大于n/3即可
 
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var dict: [Int: Int] = [:]
        for value in nums {
            if dict[value] == nil {
                dict[value] = 1
            }else{
                dict[value]! += 1
            }
        }
        var ans: [Int] = []
        for key in dict.keys {
            if dict[key]! > nums.count / 3 {
                ans.append(key)
            }
        }
        return ans
    }
}
