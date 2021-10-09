/*
 方法一：
 旋转字符串，可以使用双重循环实现
 另外可以加一些判断，如长度、为空等
 
 方法二：
 若A字符串经过旋转能够变成B字符串，那么A+A一定包含B，可以根据此方法判断
 这种方法实质上是判断一个串是否是另一个串的子串，可以使用系统的函数，如contains，
 也可以使用KMP算法
 
 */
//class Solution {
//    func rotateString(_ s: String, _ goal: String) -> Bool {
//        if s == goal {
//            return true
//        }
//
//        if s.count != goal.count {
//            return false
//        }
//
//        if s.count == 0 {
//            return false
//        }
//
//        let charArray = Array(s)
//        for len in 1...charArray.count - 1 {
//            let moveS = self.generateString(0, len, charArray)
//            let afterS = self.generateString(len, charArray.count - len, charArray)
//            let resultS = afterS + moveS
//            if resultS == goal {
//                return true
//            }
//        }
//        return false
//    }
//
//    func generateString(_ start: Int, _ len: Int, _ array: [Character]) -> String {
//        var s = ""
//        var begin = start,end = start + len
//        while begin < end {
//            s = s + String(array[begin])
//            begin += 1
//        }
//        return s
//    }
//}


class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        if s == goal {
            return true
        }

        if s.count != goal.count {
            return false
        }

        if s.count == 0 {
            return false
        }
        let ss = s + s
        return ss.contains(goal)
    }
}


// 测试用例
var solution = Solution()
print(solution.rotateString("abcde", "cdeab"))
print(solution.rotateString("abcde", "abced"))