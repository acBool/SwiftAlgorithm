/*
 移除数组中指定元素
 题目要求不能开辟新数组
 思路：使用双指针法
 left以前的都是不相同元素，right指针负责向后移动
 如果 num[right] != val, num[left] = num[right]
 和有序数组中删除重复元素思路类似
 
 */
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var left = 0, right = 0
        while right <= nums.count - 1 {
            if nums[right] != val {
                nums[left] = nums[right]
                left += 1
            }
            
            right += 1
        }
        return left
    }
}

// 测试用例
var solution = Solution()
var array = [2]
print(solution.removeElement(&array, 3))
