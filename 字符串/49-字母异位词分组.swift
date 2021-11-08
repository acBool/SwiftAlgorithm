/*
 49-字母异位词分组
 想清楚一点就可以：如果两个单词是字母异位词，则这两个单词中每个字符出现的次数相等
 根据这一点，可以统计出每个单词中每个字符出现的次数，以此为key
 将结果保存到字典中即可
 
 */
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {

        if strs.count == 0 {
            return [[""]]
        }

        var ans: [[String]] = [[String]]()
        var tmpArray: [String] = []
        tmpArray.append(strs[0])
        // 过滤只有1个元素的情况
        if strs.count == 1 {
            ans.append(tmpArray)
            return ans
        }

        // 至少两个元素
        // 使用字典存储结果。key是字符串对应的key，value是数组
        var diffDict: [String: [String]] = [:]
        for str in strs {
            let key = generateKey(str)
            if diffDict.keys.contains(key) {
                diffDict[key]?.append(str)
            }else {
                let tArray: [String] = [str]
                diffDict[key] = tArray
            }
        }

        for value in diffDict.values {
            ans.append(value)
        }
        return ans
    }

    
    // 计算每个字符串对应的hash值
    func generateKey(_ str: String) -> String {
        let array : [Character] = Array(str)
        var cntArray: [Int] = Array(repeating: 0, count: 26)
        let aChar: Character = "a"
        
        for char in array {
            cntArray[Int((char.asciiValue ?? 0) - (aChar.asciiValue ?? 0))] += 1
        }
        
        var key = ""
        for value in cntArray {
            key = key + ":" + String(value)
        }
        return key
    }
}

// 测试用例
var solution = Solution()
print(solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
print(solution.groupAnagrams([""]))
print(solution.groupAnagrams(["a"]))

print(solution.groupAnagrams(["bbbbbbbbbbc","bdddddddddd"]))