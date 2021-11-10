/*
 495-提莫攻击
 模拟题目，比较简单。注意好边界情况即可
 
 */
class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        var left = Int.max, right = Int.max, sum = 0
        var tmpLeft = 0,tmpRight = 0
        
        for num in timeSeries {
            tmpLeft = num
            tmpRight = num + duration - 1
            
            // 处理第一组数据情况
            if left == Int.max {
                left = tmpLeft
                right = tmpRight
            }else {
                // 后一个的左边界在前一个范围内 || 两者紧邻，可以合并
                if tmpLeft <= right || tmpLeft == right + 1{
                    right = tmpRight
                }else {
                    sum += (right - left + 1)
                    left = tmpLeft
                    right = tmpRight
                }
            }
        }
        if left == Int.max && right == Int.max {
            sum += (tmpRight - tmpLeft + 1)
        }else {
            sum += (right - left + 1)
        }
        
        return sum
    }
}

// 测试用例
var solution = Solution()
print(solution.findPoisonedDuration([1,4], 2))
//print(solution.findPoisonedDuration([1,2], 2))
//print(solution.findPoisonedDuration([1,2,3,4,5,6,7,8,9], 1))
//print(solution.findPoisonedDuration([1,3,5,7,9,11,13,15], 1))
