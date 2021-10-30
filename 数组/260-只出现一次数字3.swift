/*
 260-只出现一次的数字3
 普通的方法，用字典存下来即可，缺点是需要开辟额外的空间
 
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return []
        }
        var dict: [Int: Bool] = [:]
        for value in nums {
            if dict.keys.contains(value) {
                dict.removeValue(forKey: value)
            }else{
                dict[value] = true
            }
        }
        return Array(dict.keys)
    }
}


var solution = Solution()
print(solution.singleNumber([1,2,1,3,2,5]))
