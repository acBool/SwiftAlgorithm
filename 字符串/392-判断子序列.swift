/*
 判断子序列
 判断子串是否是父串的子序列，父串可以删除字符，如
 abc 是  aczbdc 的子序列，因为父串中删除一些字符后能够得到abc
 
 思路：
 双指针法。一个指针指向子串，一个指针指向父串，如果两个指针指向的字符相等，则同时向后移动；否则父指针向后移动
 
 */
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty && t.isEmpty {
            return true
        }
        
        let sArray = Array(s)
        let tArray = Array(t)
        var i = 0,j = 0
        while i < sArray.count && j < tArray.count {
            if sArray[i] == tArray[j]{
                i += 1
                j += 1
            }else{
                j += 1
            }
        }
        if i == sArray.count {
            return true
        }
        return false
    }
}
