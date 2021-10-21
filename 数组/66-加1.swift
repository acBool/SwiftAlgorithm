/*
 加1
 数组类题目，比较简单，结果数组可能比原数组长1，最后一位记得处理进位即可
 
 */
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var ans: [Int] = []
        var carrer = 1
        var sum = 0
        for value in digits.reversed() {
            sum = value + carrer
            carrer = sum >= 10 ? 1 : 0
            sum = sum >= 10 ? sum - 10 : sum
            ans.append(sum)
        }
        if carrer > 0 {
            ans.append(carrer)
        }
        return ans.reversed()
    }
}