/*
 22-括号生成
 使用深度优先搜索即可，或者也可以理解为回溯法+剪枝
 和 17-电话号码的字母组合 比较类似，只不过这道题
 过滤了一些非法情况
 
 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 1 {
            return ["()"]
        }
        
        var ans: [String] = []
        dfs("", true, &ans, 2 * n)
        
        return ans
    }
    
    
    func dfs(_ parentStr: String, _ flag: Bool, _ ans: inout [String], _ totalCount: Int) {
        if flag == false {
            return
        }
        
        if flag == true && parentStr.count == totalCount {
            ans.append(parentStr)
            return
        }
        
        let array: [Character] = ["(",")"]
        for char in array {
            let temp = parentStr + String(char)
            dfs(temp,isValidParent(temp,totalCount),&ans,totalCount)
        }
    }
    
    
    func isValidParent(_ parentStr: String, _ totalCnt: Int) -> Bool {
        var array:[Character] = []
        for char in parentStr {
            if char == "(" {
                array.append(char)
            }else if char == ")" {
                if array.count > 0 {
                    array.removeLast()
                }else{
                    return false
                }
            }
        }
        
        if array.count == 0 {
            return true
        }
        
        if array.count > 0 {
            // 包含有括号，说明非法
            if array.contains(")") {
                return false
            }
            
            if parentStr.count == totalCnt {
                // 这种情况下，若array中还有元素，说明非法
                return false
            }
            
            // 只有左括号，还要判断长度，避免出现全是左括号的情况
            if array.count > totalCnt / 2 {
                return false
            }
        }
        
        return true
    }
}


// 测试用例
var solution = Solution()
print(solution.generateParenthesis(2))
//print(solution.isValidParent("(()(", 8))
//print(solution.isValidParent("()((", 8))
//print(solution.isValidParent("((", 4))

print(solution.generateParenthesis(3))
