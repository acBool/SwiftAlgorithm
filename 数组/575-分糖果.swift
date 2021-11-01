/*
 575-分糖果
 题目简单，无难度
 
 */
class Solution {
    func distributeCandies(_ candyType: [Int]) -> Int {
        var dict: [Int: Bool] = [:]
        let total = candyType.count
        
        for value in candyType {
            if dict.keys.contains(value) == false && Array(dict.keys).count < total / 2 {
                dict[value] = true
            }
        }
        return Array(dict.keys).count
    }
}
