/*
 3-无重复字符的最长字符
 滑动窗口法。定义一个窗口数组，窗口数组中存的都是不重复的子串；
 窗口数组不断的向右滑动，当遇到有重复字符时，窗口数组从左开始删除，
 一直删除到重复字符为止。
 
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength: Int = 0
        var diffArray: [Character] = []
        let array = Array(s)
        
        for character in array {
            while diffArray.contains(character){
                // 需要进行删除
                diffArray.remove(at: 0)
            }
            diffArray.append(character)
            maxLength = max(maxLength,diffArray.count)
        }
        
        return maxLength
    }
}
