/*
 检测大写字母
 思路：
 题目没难度，分别判断3种情况就可以
 全小写
 全大写
 首字母大写
 
 */
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        if word.isEmpty || word.count == 0 {
            return false
        }
        
        let charArray: [Character] = Array(word)
        
        if charArray[0] >= "a" && charArray[0] <= "z" {
            // 第一个字母为小写，则需要全部小写
            return self.judgeAllSmallChar(charArray,0)
        }else{
            // 第一个字母为大写，需要判断第二个字母
            if charArray.count > 1 {
                if charArray[1] >= "A" && charArray[1] <= "Z" {
                    // 连续两个字母为大写，需要所有字母为大写
                    return self.judgeAllBigChar(charArray)
                }else{
                    // 第一个字母大写，第二个字母小写，需要从第二个字母开始都是小写
                    return self.judgeAllSmallChar(charArray, 1)
                }
            }else{
                return true
            }
        }
    }
    
    func judgeAllSmallChar(_ array: [Character],_ startIndex: Int) -> Bool {
        var flag = true
        for i in startIndex...array.count - 1 {
            if array[i] >= "a" && array[i] <= "z" {
                continue
            }else{
                flag = false
                break
            }
        }
        return flag
    }
    
    func judgeAllBigChar(_ array: [Character]) -> Bool {
        var flag = true
        for i in 0...array.count - 1 {
            if array[i] >= "A" && array[i] <= "Z" {
                continue
            }else{
                flag = false
                break
            }
        }
        return flag
    }
}
