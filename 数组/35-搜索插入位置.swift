/*
 搜索插入位置
 在一个有序数组中，寻找某个值。如果找到了，返回索引；未找到，返回应该插入的位置
 
 思路：
 使用二分查找，比较简单
 
 */
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 1
        }
        var left = 0, right = nums.count - 1,mid = 0
        while left <= right {
            mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }else if nums[mid] > target {
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        // 没找到
        return min(left,right) + 1
    }
}
