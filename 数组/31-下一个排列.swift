/*
 31-下一个排列
 题目要求不能使用额外空间，因此只能在原有数组上修改
 找下一个排列，需要：
 1. 在左侧找一个小的数，和右侧的一个大的数进行交换，且大的数应该尽量小
 2. 交换之后，左侧index之后的所有数，应该按照升序排序
 
 官方题解比较巧妙，先找到了一个降序子序列，第一步完成后，确保右侧的序列
 让然是降序的。然后按照升序排序，用的是双指针法，这样，达到了没有额外使用
 空间的要求。
 
 具体实现看代码
 
 */
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        var index = nums.count - 2
        var flag = false
        while(index >= 0) {
            if nums[index] < nums[index + 1] {
                flag = true
                break
            }
            index -= 1
        }
        if !flag {
            nums = nums.sorted()
        }else{
            // index往后，全都是降序排列
            var rightIndex = nums.count - 1
            while rightIndex > index {
                if nums[index] < nums[rightIndex] {
                    break
                }
                rightIndex -= 1
            }
            // rightIndex 从后往前找，第一个比index大的数
            // 交换index 和 rightIndex
            var tmp = nums[rightIndex]
            nums[rightIndex] = nums[index]
            nums[index] = tmp
            // 交换之后，从 [index+1,nums.count-1]之间，仍然是降序排列
            // 需要将其改为升序。为避免使用额外空间，使用双指针法
            var i = index + 1, j = nums.count - 1
            while i < j {
                tmp = nums[j]
                nums[j] = nums[i]
                nums[i] = tmp
                i += 1
                j -= 1
            }
        }

        print(nums)
    }
}

var solution = Solution()
//var array = [1,2,3]
//var array = [1,1,5]
//var array = [3,2,1]
var array = [1,3,2]
solution.nextPermutation(&array)