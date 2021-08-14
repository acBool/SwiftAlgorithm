/*
 删除数组中的重复元素
 题目要求不能额外开辟数组，因此使用双指针法
 left指针及以前都是不重复元素；right指针为找到的下一个不重复元素
 因为数组是有序的，因此只需要和前一个元素比较即可
 nums[left] == nums[right]  right后移
 nums[left] ！= nums[right] left后移，并将right的值赋值给left
 
 */
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        var left = 0, right = 1
        while right < nums.count {
            if nums[left] != nums[right] {
                left += 1
                nums[left] = nums[right]
            }
            
            right += 1
        }
        return left + 1
    }
}
