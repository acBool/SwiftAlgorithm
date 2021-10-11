/*
 找两个字符串的不同
 将两个字符串分别排序，第一个不同的就是所要找的字符
 
 也可以使用异或的方法
 */
class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        if s.count == 0 {
            return Character(t)
        }
        
        var sArray: [Character] = Array(s)
        var tArray: [Character] = Array(t)
        
        sArray.sort()
        tArray.sort()
        for i in 0...sArray.count - 1 {
            if sArray[i] != tArray[i] {
                return tArray[i]
            }
        }
        
        return tArray[tArray.count - 1]
    }
}
