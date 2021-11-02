/*
 最长回文子串
 动态规划的经典题目。
 关键是想明白，如果内部的子串是回文串，且两端字符相等，那么新子串也是回文串。
 举例来说，abba, 内部子串bb是回文串，两端字符a=a，那么abba也是回文串
 
 */
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let strCount = s.count
        if strCount <= 1 {
            return s
        }
        
        // dp[i][j] 表示从i开始，到j结束的子串，是否是回文字符串
        // 状态转移方程： 如果dp[i+1][j-1]是回文串，且str[i] == str[j]，那么dp[i][j]也是回文串
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: strCount), count: strCount)
        let charArray = Array(s)
        var maxLength: Int = 0
        var ans = ""
        for i in 0..<strCount {
            dp[i][i] = true
        }
        
        var len = 2
        var beginIndex = 0, endIndex = 0
        while len <= strCount {
            for i in 0..<strCount {
                let end = i + len - 1
                if end >= strCount {
                    break
                }
                // 如果长度等于2，直接比较是否相等即可；如果大于2，还需要判断子串是否也是回文串
                if charArray[i] == charArray[end] {
                    if len > 2 {
                        if dp[i+1][end-1]{
                            dp[i][end] = true
                        }
                    }else {
                        dp[i][end] = true
                    }
                    if dp[i][end] && len > maxLength {
                        maxLength = len
                        beginIndex = i
                        endIndex = end
                    }
                }
            }
            len += 1
        }
        for i in beginIndex...endIndex {
            ans += String(charArray[i])
        }
        return ans
    }
}


// 测试用例
var solution = Solution()
//solution.longestPalindrome("cbbd")
//solution.longestPalindrome("babad")
//solution.longestPalindrome("bb")
solution.longestPalindrome("aacabdkacaa")