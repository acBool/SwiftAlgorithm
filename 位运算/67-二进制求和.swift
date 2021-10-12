/*
 二进制求和，和字符串求和、链表求和比较类似，没有什么难度，注意细节
 
 */
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var ans = ""
        let aArray: [Character] = Array(a)
        let bArray: [Character] = Array(b)
        var carrer: Int = 0, lastA = aArray.count - 1, lastB = bArray.count - 1
        while lastA >= 0 && lastB >= 0 {
            let aValue = Int(aArray[lastA].asciiValue!) - 48, bValue = Int(bArray[lastB].asciiValue!) - 48
            var sum = aValue + bValue + carrer
            if sum > 1 {
                sum = sum - 2
                carrer = 1
            }else{
                carrer = 0
            }
            ans += String(sum)
            lastA -= 1
            lastB -= 1
        }
        
        if lastA >= 0 {
            self.addLastString(aArray, lastA, &ans, &carrer)
        }
        
        if lastB >= 0 {
            self.addLastString(bArray, lastB, &ans, &carrer)
        }
        if carrer > 0 {
            ans += "1"
        }
        
        return String(ans.reversed())
    }
    
    
    func addLastString(_ array: [Character], _ index: Int, _ ans: inout String, _ carrer: inout Int) {
        var i = index
        while i >= 0 {
            let value = Int(array[i].asciiValue!) - 48
            var sum = value + carrer
            if sum > 1 {
                sum = sum - 2
                carrer = 1
            }else{
                carrer = 0
            }
            ans += String(sum)
            i -= 1
        }
    }
}

// 测试用例
var solution = Solution()
//print(solution.addBinary("1010", "1011"))
//print(solution.addBinary("1111", "1111"))
//print(solution.addBinary("11", "1"))
print(solution.addBinary("1010", "1011"))
