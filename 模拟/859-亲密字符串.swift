/*
 859-亲密字符串
 模拟题目，本来以为有什么规律，实际上没有什么规律，就是简单的模拟题。
 按照题目的要求，判断是否只能交换两个位置，实现两个字符串相等
 需要注意以下几种情况：
 aa 和 aa
 abcd 和 abcd
 实际上，需要考虑的特殊情况题目测试数据已经包含了
 
 */
class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        if s.count < 2 || goal.count < 2 {
            return false
        }
        
        if s.count != goal.count {
            return false
        }
        
        let arrayS: [Character] = Array(s)
        var dictS: [Character:Int] = [:]
        let arrayGoal: [Character] = Array(goal)
        var dictGoal: [Character: Int] = [:]
        
        for char in arrayS {
            if let value = dictS[char] {
                dictS[char] = value + 1
            }else{
                dictS[char] = 1
            }
        }
        
        for char in arrayGoal {
            if let value = dictGoal[char] {
                dictGoal[char] = value + 1
            }else{
                dictGoal[char] = 1
            }
        }
        
        for key in dictS.keys {
            if dictGoal.keys.contains(key){
                if dictS[key]! != dictGoal[key]! {
                    return false
                }
            }else{
                return false
            }
        }
        
        // 字母都是相同的
        var difCnt = 0
        var ans = ""
        for index in 0..<arrayS.count {
            if arrayS[index] != arrayGoal[index] {
                difCnt += 1
                ans += String(arrayS[index])
                ans += String(arrayGoal[index])
            }
        }
        
        if difCnt == 0 {
            // 两个字符串相同，判断是否有相同字符
            for key in dictS.keys {
                if dictS[key]! > 1 {
                    return true
                }
            }
            return false
        }
        
        // 只有两个不同,ans长度为4
        if difCnt == 2 {
            let arrayAns = Array(ans)
            if arrayAns.count == 4{
                if arrayAns[0] == arrayAns[3] && arrayAns[1] == arrayAns[2] {
                    return true
                }
            }
        }
        
        return false
    }
}


var solution = Solution()
print(solution.buddyStrings("ab", "ba"))
print(solution.buddyStrings("aa", "aa"))
print(solution.buddyStrings("ab", "ab"))
print(solution.buddyStrings("aaaaaaabc", "aaaaaaacb"))