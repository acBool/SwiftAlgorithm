/*
 多数元素
 判断哪个元素出现的次数超过了n/2
 
 思路：
 使用字典存下来每个元素出现的次数即可
 
 */
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var dict: [Int: Int] = [:]
        var maxValue = 0,magorityNum = 0
        for i in 0...nums.count - 1 {
            let key = nums[i]
            if let value = dict[key] {
                dict[key] = value + 1
            }else{
                dict[key] = 1
            }
            if dict[key]! > maxValue {
                maxValue = dict[key]!
                magorityNum = key
            }
        }
        return magorityNum
    }
}
