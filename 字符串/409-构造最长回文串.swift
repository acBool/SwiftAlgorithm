/*
 构造最长回文串
 
 思路：
 1. 如果一个字符出现了偶数次，那么其一定可以构成回文串。如AAAA,bb
 2. 如果一个字符出现了奇数次，那么其长度减1一定可以构成回文串，如aaa，可以构成aa回文串
 3. 如果出现了奇数，那么最后的长度需要加1.举例来说
 aabbbcc
 aa、cc都是偶数次，直接加就可以，为4;
 bbb为奇数次，可以构成bb，也就是说现在的回文串是
 abccba,每个字符出现都是偶数次，那么在中间加入一个字符（奇数次字符），还是回文串。所以有奇数，最后要再加1
 
 */
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        if s.isEmpty || s == "" {
            return 0
        }
        if s.count < 2 {
            return 1
        }
        
        let cnt = 26
        var smallArray: [Int] = Array(repeating: 0, count: cnt)
        var bigArray: [Int] = Array(repeating: 0, count: cnt)
        let smallChar: Character = "a"
        let smallBegin = Int(smallChar.asciiValue!)
        let bigChar: Character = "A"
        let bigBegin = Int(bigChar.asciiValue!)
        let charArray = Array(s)
        
        for char in charArray {
            if char >= "a" && char <= "z" {
                let index = Int(char.asciiValue!) - smallBegin
                smallArray[index] += 1
            }else if char >= "A" && char <= "Z" {
                let index = Int(char.asciiValue!) - bigBegin
                bigArray[index] += 1
            }
        }
        var ans = 0,smallFlag = false,bigFlag = false
        self.getPalindrome(smallArray, &ans,&smallFlag)
        self.getPalindrome(bigArray, &ans,&bigFlag)
        if smallFlag && bigFlag {
            // 多算了一次
            ans = ans - 1
        }
        return ans
    }
    
    func getPalindrome(_ array:[Int], _ sum: inout Int,_ flag: inout Bool) {
        //flag 判断是否有奇数，有奇数最后需要加1
        for value in array {
            if value % 2 == 0 {
                sum += value
            }else {
                sum = sum + value - 1
                flag = true
            }
        }
        if flag {
            sum = sum + 1
        }
    }
}
