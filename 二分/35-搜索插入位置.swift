/*
 标准的二分查找题目，没有什么难度
 二分查找注意地方：
    1. left <= right，注意包含等号
    2. right = mid - 1 , 注意需要 -1
    3. left = mid + 1, 注意需要 + 1
    4. 如果找不到，则 min(left, right) + 1

 另外，这道题可以在开头判断一些临界条件
 
 */
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        if target > nums.last! {
            return nums.count
        }else if target < nums[0] {
            return 0
        }else{
            var leftIndex = 0, rightIndex = nums.count - 1, midIndex = 0
            while leftIndex <= rightIndex {
                midIndex = (leftIndex + rightIndex) / 2
                if nums[midIndex] == target {
                    return midIndex
                }else if nums[midIndex] > target {
                    rightIndex = midIndex - 1
                }else {
                    leftIndex = midIndex + 1
                }
            }
            return min(leftIndex,rightIndex) + 1
        }
    }
}

// 测试用例
var solution = Solution()
print(solution.searchInsert([1,3,5,6], 5))
print(solution.searchInsert([1,3,5,6], 2))
print(solution.searchInsert([1,3,5,6], 7))
print(solution.searchInsert([1,3,5,6], 0))
print(solution.searchInsert([1,3], 2))

