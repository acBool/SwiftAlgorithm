/*
 33-搜索旋转排序数组
 题目给的数组可以分成两部分，左侧部分是有序的，右侧部分是有序的
 因此可以找到临界值，临界值左侧有序，临界值右侧也是有序。找临界值使用二分法找
 找到临界值后，在左侧用二分查找，在右侧用二分查找即可
 这道题用了两次二分查找
 
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        
        let midIndex = self.findIndex(nums)
        var searchIndex = self.findTargetValue(nums, 0, midIndex, target)
        if searchIndex > -1 {
            return searchIndex
        }
        searchIndex = self.findTargetValue(nums, midIndex+1, nums.count - 1, target)
        
        return searchIndex
    }
    
    func findIndex(_ nums: [Int]) -> Int{
        var left = 0,right = nums.count - 1,mid = 0
        while left <= right {
            mid = left + (right - left) / 2
            if  (mid < nums.count - 1)  &&  (nums[mid] > nums[mid + 1]){
                // 找到了，返回
                return mid
            }else if  (mid >= 1)  && (nums[mid] < nums[mid - 1]) {
                // 找到了，返回
                return mid - 1
            }else{
                if nums[mid] > nums[left] {
                    left = mid + 1
                }else {
                    right = mid - 1
                }
            }
        }
        return mid
    }
    
    func findTargetValue(_ nums:[Int], _ left: Int, _ right: Int, _ target: Int) -> Int{
        var leftEdge = left,rightEdge = right,mid = 0
        while leftEdge <= rightEdge {
            mid = (leftEdge + rightEdge) / 2
            if nums[mid] == target {
                return mid
            }else if nums[mid] > target {
                rightEdge = mid - 1
            }else {
                leftEdge = mid + 1
            }
        }
        return -1
    }
}

// 测试用例
var solution = Solution()
//print(solution.search([4,5,6,7,0,1,2], 0))

print(solution.search([1,3], 3))
