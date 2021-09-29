/*
 求两个数组的交集，题目没有什么难度
 方法一：使用双重for循环即可，将结果存到一个数组中。时间复杂度是O(m * n)
 方法二：方法1时间复杂度比较高，可以使用字典将一个数组的元素存起来，然后遍历数组2即可。
 相对于方法1有较大的时间提升
 方法三：可以将两个数组分别排序，然后使用双指针法。两个指针分别指向两个数组开始，若不等，则
 较小值的指针向后移动；若相等，添加到数组中，同时向后移动；有一个数组越界即结束
 
 */
//class Solution {
//    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        var ansArray: [Int] = []
//        for num in nums1 {
//            if nums2.contains(num) {
//                if ansArray.contains(num) == false {
//                    ansArray.append(num)
//                }
//            }
//        }
//        return ansArray
//    }
//}

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var ansArray: Set<Int> = Set<Int>()
        var dict: [Int: Int] = [:]
        
        for num in nums1 {
            dict[num] = num
        }
        
        for num in nums2 {
            if dict[num] != nil {
                ansArray.insert(num)
            }
        }
        
        return Array(ansArray)
    }
}


// 测试用例
var solution = Solution()
print(solution.intersection([1,2,2,1], [2,2]))
print(solution.intersection([4,9,5], [9,4,9,8,4]))
