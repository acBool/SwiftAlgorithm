/*
 两数之和
 因为题目给的是有序数组，因此寻找另一个树时可以使用二分查找。整体的时间复杂度是 nlogn
 
 另外，题解中也有说双指针的解法，可以优化到O(n)
 
 也可以将所有值存到一个字典中，利用字典查找（这种方法我猜测整体时间复杂度仍旧是 nlogn）
 
 */
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        for i in 0..<numbers.count {
            let oneValue: Int = numbers[i]
            let targetValue = target - oneValue
            let pos = self.findTargetIndex(numbers, i + 1, targetValue)
            if pos > i {
                return [i + 1, pos + 1]
            }
        }
        
        return []
    }
    
    func findTargetIndex(_ numbers: [Int], _ leftIndex: Int, _ target: Int) -> Int {
        var left = leftIndex, right = numbers.count - 1
        var mid = 0
        while left <= right {
            mid = (left + right) / 2
            if numbers[mid] == target {
                return mid
            }else if numbers[mid] < target {
                left = mid + 1
            }else {
                right = mid - 1
            }
        }
        return -1
    }
}

// 测试用例
var solution = Solution()
print(solution.twoSum([2,7,11,15], 9))
print(solution.twoSum([2,3,4], 6))
print(solution.twoSum([-1,0], -1))
