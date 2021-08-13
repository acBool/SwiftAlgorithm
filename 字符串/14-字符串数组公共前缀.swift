/*
 求一组字符串的最长公共前缀
 思路：
 1. 假设有两个字符串，s1、s2，求这两个字符串的最长公共前缀，那么遍历两个字符串就可以得到
 2. 假设有三个字符串,s1,s2,s3,求着三个字符串的最长公共前缀。可以先求出前两个的最长公共前缀commonStr，
 然后再求commonStr和s3的最长公共前缀。也就是说，三个字符串，可以转化成两个字符串求两次
 3. 依据此思路，如果是数组，先求出前两个字符串公共前缀，然后用公共前缀和后面的字符串一起，依次就公共前缀，
 并且实时更新公共前缀
 4. 如果某次循环后，公共前缀为空串，此时可以直接返回，没必要继续循环
 
 注意：
 1. 注意数组为空的情况
 2. 注意数组只有1个元素的情况
 
 */
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty || strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs[0]
        }
        
        let preStr = strs[0]
        var commonStr = ""
        
        for index in 1...strs.count-1 {
            if index == 1 {
                commonStr = self.getCommonPrefix(preStr, strs[index])
            }else{
                if commonStr.isEmpty || commonStr.count == 0 {
                    break
                }
                commonStr = self.getCommonPrefix(commonStr, strs[index])
            }
        }
        return commonStr
    }
    
    func getCommonPrefix(_ s1: String, _ s2: String) -> String {
        var index = 0
        var common = ""
        while index < s1.count && index < s2.count {
            if s1[s1.index(s1.startIndex, offsetBy: index)] != s2[s2.index(s2.startIndex, offsetBy: index)] {
                common = common + String(s1[s1.index(s1.startIndex, offsetBy: index)])
                break
            }
            index += 1
        }
        return String(s1.prefix(index))
    }
}
