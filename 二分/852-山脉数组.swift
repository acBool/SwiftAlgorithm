/*
 所给的数据已经是山脉数组了，因此只需要找到第一个元素，其比后一个元素大就可以
 遍历一次就行，时间复杂度为O(n)
 另外可以用二分的方法，时间复杂度为O(logn),思路和遍历一样，找到一个元素，比后一个元素大
 
 */
//class Solution {
//    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
//        if arr.count < 3 {
//            return -1
//        }
//        for index in 0...arr.count - 2 {
//            if arr[index] > arr[index + 1] {
//                return index
//            }
//        }
//        return -1
//    }
//}


class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        if arr.count < 3 {
            return -1
        }
        var left = 0, right = arr.count - 2, mid = 0,ans = 0
        while left <= right {
            mid = (left + right) / 2
            if arr[mid] > arr[mid + 1] {
                ans = mid
                right = mid - 1
            }else{
                left = mid + 1
            }
        }
        return ans
    }
}
