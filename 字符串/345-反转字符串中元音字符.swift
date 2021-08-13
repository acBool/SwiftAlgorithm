/*
 反转字符串中的元音字符
 
 思路：
 1. 使用双指针，一个指针正序，一个指针倒序，如果双指针指向的都是元音，将两者交换；否则，移动指针
 
 */
class Solution {
    func reverseVowels(_ s: String) -> String {
        if s.isEmpty || s.count <= 1 {
            return s
        }
        
        let voweArray: [Character] = ["a","e","i","o","u","A","E","I","O","U"]
        var charArray = Array(s)
        
        var left = 0,right = charArray.count - 1
        while left < right {
            if voweArray.contains(charArray[left]) && voweArray.contains(charArray[right]) {
                // 左右两侧都是元音字母，交换
                let temp = charArray[left]
                charArray[left] = charArray[right]
                charArray[right] = temp
                left += 1
                right -= 1
            }else if voweArray.contains(charArray[left]) {
                // 左侧是元音，右侧不是
                right -= 1
            }else if voweArray.contains(charArray[right]){
                // 右侧是元音，左侧不是
                left += 1
            }else {
                left += 1
                right -= 1
            }
        }
        var ans = ""
        for char in charArray {
            ans += String(char)
        }
        return ans
    }
}
