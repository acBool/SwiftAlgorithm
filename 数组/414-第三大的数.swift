/*
 找出一个数组中第三大的数。
 一种繁琐的方法：遍历数组三次，排除最大的值；再排除次大的值；再找到的最大值就是第三大的数
 
 另外一种方法是：设置三个变量分别为第一大、第二大、第三大，循环遍历数组，分别和三个值比较
 如果大于第一大，则将第三大赋值为第二大，第二大赋值为第一大，第一大赋值为数组元素；
 如果小于第一大，大于第二大，则将第三大赋值为第二大，第二大赋值为数组元素；
 如果小于第二大，大于第三大，则将第三大赋值为数组元素；
 这种方法只遍历一次
 */
//class Solution {
//    func thirdMax(_ nums: [Int]) -> Int {
//        var firstMax: Int = Int.min
//        for index in 0...nums.count - 1 {
//            if nums[index] > firstMax {
//                firstMax = nums[index]
//            }
//        }
//
//        var secondMax: Int = Int.min
//        for index in 0...nums.count - 1 {
//            if ((nums[index] > secondMax) && (nums[index] != firstMax)) {
//                secondMax = nums[index]
//            }
//        }
//
//        var thirdMax: Int = Int.min
//        for index in 0...nums.count - 1 {
//            if ((nums[index] > thirdMax) && (nums[index] != firstMax) && (nums[index] != secondMax)) {
//                thirdMax = nums[index]
//            }
//        }
//
//
//        return (thirdMax == Int.min) ? firstMax : thirdMax
//    }
//}


class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0],nums[1])
        }
        // 至少3个元素
        var firstMax = Int.min, secondMax = Int.min, thirdMax = Int.min
        for index in 0...nums.count - 1 {
            let value = nums[index]
            if value > firstMax {
                thirdMax = secondMax
                secondMax = firstMax
                firstMax = value
            }else if value < firstMax && value > secondMax {
                thirdMax = secondMax
                secondMax = value
            }else if value < secondMax && value > thirdMax {
                thirdMax = value
            }
        }
        return thirdMax == Int.min ? firstMax : thirdMax
    }
}


// 测试用例
var solution = Solution()
print(solution.thirdMax([3,2,1]))

print(solution.thirdMax([1,2]))

print(solution.thirdMax([2,2,3,1]))
