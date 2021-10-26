/*
 496-下一个更大元素
 题目没什么难度，直接双重循环就可以
 
 */
//class Solution {
//    func nextGreaterElement(_ nums1:[Int], _ nums2: [Int]) -> [Int] {
//        var dict: [Int: Int] = [:]
//        for index in 0..<nums2.count {
//            let value = nums2[index]
//            dict[value] = index
//        }
//        var ans: [Int] = []
//        for value in nums1 {
//            let index = dict[value]
//            ans.append(self.findGreaterValue(index!, nums: nums2, value))
//        }
//        return ans
//    }
//
//    func findGreaterValue(_ begin: Int, nums:[Int], _ value: Int) -> Int {
//        for index in begin..<nums.count {
//            if nums[index] > value {
//                return nums[index]
//            }
//        }
//        return -1
//    }
//}


/*
 另外还可以使用单调栈来解决该问题，这样时间复杂度为O(m+n)
 单调栈，简单来说就是栈中的元素都是升序的。因为要找下一个大的值，因此
 从右向左遍历，这样可以把每个数下一个大的值直接记录下来
 
 */
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict: [Int: Int] = [:]
        var ans: [Int] = []
        var array: [Int] = []
        for value in nums2.reversed() {
            while array.count > 0 && value > array[0] {
                array.remove(at: 0)
            }
            dict[value] = array.count == 0 ? -1 : array[0]
            array.insert(value, at: 0)
        }
        //print(array)
        for value in nums1 {
            ans.append(dict[value]!)
        }
        return ans
    }
}
