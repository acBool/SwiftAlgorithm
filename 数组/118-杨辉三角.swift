/*
 杨辉三角
 思路：
 比较简单。假设上一个数组是preArray,当前数组是array,则
 array[i] = preArray[i] + preArray[i - 1]
 注意判断边界情况即可
 
 */
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows <= 0 {
            return [[]]
        }
        var ans = [[1]]
        var index = 2
        var preArray = [1]
        while index <= numRows {
            var array:[Int] = []
            
            for i in 0...index-1 {
                let left = i - 1,right = i
                let leftValue = left < 0 ? 0 : preArray[left]
                let rightValue = right >= preArray.count ? 0 : preArray[right]
                array.append(leftValue + rightValue)
            }
            
            ans.append(array)
            preArray = array
            index += 1
        }
        
        return ans
    }
}