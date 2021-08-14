/*
 字符串相加
 从后往前相加
 
 注意：
 1. 进位
 2. 两者长度不一致的情况
 3. 全部处理完后，最后有进位的情况
 
 
 */
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        if num1.isEmpty && num2.isEmpty {
            return ""
        }
        if num1.isEmpty {
            return num2
        }
        if num2.isEmpty {
            return num1
        }
        
        var ansString = ""
        let num1Array = Array(num1)
        let num2Array = Array(num2)
        var carrier = 0,i = num1Array.count - 1, j = num2Array.count - 1
        while i >= 0 && j >= 0 {
            var sum = Int(String(num1Array[i]))! + Int(String(num2Array[j]))! + carrier
            self.operateSumAndCarrier(&sum, &carrier)
            ansString = ansString + String(sum)
            i -= 1
            j -= 1
        }
        
        while i >= 0 {
            var sum = Int(String(num1Array[i]))! + carrier
            self.operateSumAndCarrier(&sum, &carrier)
            ansString = ansString + String(sum)
            
            i -= 1
        }
        
        while j >= 0 {
            var sum = Int(String(num2Array[j]))! + carrier
            self.operateSumAndCarrier(&sum, &carrier)
            ansString = ansString + String(sum)
            j -= 1
        }
        
        // 最后有进位
        if carrier > 0 {
            ansString = ansString + String(carrier)
        }
        
        return String(ansString.reversed())
    }
    
    func operateSumAndCarrier(_ sum: inout Int, _ carrier: inout Int) {
        if sum >= 10{
            sum = sum - 10
            carrier = 1
        }else{
            carrier = 0
        }
    }
}
