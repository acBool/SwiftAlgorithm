/*
 34-查找第一个和最后一个位置
 题目比较简单，直接用二分即可
 
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {
            return [-1,-1]
        }
        
        var left = 0, right = nums.count - 1, mid = 0
        var find = false
        while left <= right {
            mid = left + (right - left) / 2
            if nums[mid] == target {
                find = true
                break
            }else if nums[mid] > target {
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        
        if !find {
            return [-1,-1]
        }
        var leftIndex = mid,rightIndex = mid
        //print(mid)
        while(leftIndex > 0 && nums[leftIndex - 1] == target) {
            leftIndex -= 1
        }
        
        while(rightIndex < nums.count - 1 && nums[rightIndex + 1] == target) {
            rightIndex += 1
        }
        
        return [leftIndex,rightIndex]
    }
}

var solution = Solution()
//print(solution.searchRange([5,7,7,8,8,10], 6))

print(solution.searchRange([2,2], 2))
