/*
 有效括号
 思路：
 利用栈的思想。当碰到左括号时，入栈；当碰到右括号时，判断栈顶元素和右括号是否匹配；
 匹配，则将栈顶元素出栈；不匹配，直接返回false
 
 最后，如果栈为空，返回true；否则返回false
 
 另外，可以添加判断条件，如果字符串长度为奇数，直接返回false
 
 */
class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 > 0 {
            return false
        }
        
        let leftCharacter: [Character] = ["{","(","["]
        let rightCharacter: [Character] = ["}",")","]"]
        var stackArray:[Character] = []
        
        for char in s {
            if leftCharacter.contains(char){
                // 入栈
                stackArray.insert(char, at: 0)
            }else if rightCharacter.contains(char) {
                if stackArray.count == 0 {
                    return false
                }else{
                    let topChar = stackArray[0]
                    // 判断是否匹配
                    if self.isMatch(topChar, char){
                        stackArray.remove(at: 0)
                    }else{
                        // 不匹配，返回false
                        return false
                    }
                }
            }else{
                // 非法字符
                return false
            }
        }
        return stackArray.count == 0
    }
    
    func isMatch(_ leftChar: Character, _ rightChar: Character) -> Bool {
        if (leftChar == "{" && rightChar == "}") || (leftChar == "(" && rightChar == ")") || (leftChar == "[" && rightChar == "]"){
            return true
        }
        return false
    }
}
