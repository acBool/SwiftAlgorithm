/*
 单词规律
 使用字典来记录对应关系。需要注意的是，两边都是一一对应的。
 即一个字符唯一对应一个字符串，同时，一个字符串也唯一对应一个字符。
 因此，在判断时，既需要判断value是否冲突，也需要判断key是否冲突
 
 */
class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let charArray: [Character] = Array(pattern)
        let strArray: [Substring] = s.split(separator: " ")
        
        if charArray.count != strArray.count {
            return false
        }
        
        var dict: [Character:Substring] = [:]
        for i in 0..<charArray.count {
            let key = charArray[i]
            if dict.keys.contains(key) {
                if dict[key] != strArray[i] {
                    return false
                }
            }else{
                // 不包含该key，且对应的value也不存在才可以
                if dict.values.contains(strArray[i]) {
                    return false
                }
                dict[key] = strArray[i]
            }
        }
        
        return true
    }
}

// 测试用例
var solution = Solution()
print(solution.wordPattern("abba", "dog cat cat dog"))
print(solution.wordPattern("abba", "dog cat cat fish"))
