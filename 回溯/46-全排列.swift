/*
 46-全排列
 打印出一个数组的全排列。打印全排列，通常使用的是回溯法
 回溯法可以理解成暴力，将每一种情况枚举了出来，在枚举过程中，
 还需要不断的回退到上一步，这正是回溯法的由来
 通常情况下，回溯法需要借助一个数组来记录该元素是否访问过，
 当回退到上一步时，该元素的状态也需要重置
 
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {

        var resultArray: [[Int]] = [[]]
        var array: [Int] = []
        var visitArray: [Bool] = Array(repeating: false, count: nums.count)
        resultArray.removeFirst()
        dfs(nums, &array,&visitArray, &resultArray)
        return resultArray
    }


    // 回溯法
    func dfs(_ nums: [Int],_ ansArray: inout [Int], _ visit: inout [Bool], _ resultArray: inout [[Int]]) {
        if ansArray.count == nums.count {
            resultArray.append(ansArray)
            return
        }
        
        for i in 0..<nums.count {
            if visit[i] == false {
                ansArray.append(nums[i])
                visit[i] = true
                dfs(nums,&ansArray,&visit,&resultArray)
                ansArray.removeLast()
                visit[i] = false
            }
        }
    }
}

var solution = Solution()
print(solution.permute([1,2,3]))
