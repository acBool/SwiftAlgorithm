/*
 11-盛最多水的容器
 
 解析：使用双指针法。h[i]和h[j]之间围的面积是 min(h[i],h[j]) * (j - i)
 假设h[i] < h[j],此时，如果i向后移动，因为小的值有可能变大，因此最大的面积有可能变大；
 如果j向前移动，小的值要么不变（新的h[j] > h[i]）,要么变小（新的h[j] < h[i]）,且此时
 长度变小，因此无论如何这种情况最大面积都不可能变大。
 因此，只需要将小的值对应的index不断向内移动即可。
 
 反过来，如果h[i] > h[j]是同样的道理。
 
 */
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var ans: Int = 0
        var left = 0, right = height.count - 1
        
        while left < right {
            if height[left] < height[right] {
                ans = max(ans,(right - left) * height[left])
                left += 1
            }else {
                ans = max(ans,(right - left) * height[right])
                right -= 1
            }
        }
        
        return ans
    }
}
