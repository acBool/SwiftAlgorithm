/*
 492-构造矩形
 题目比较简单，直接从开方处，循环查找即可
 
 */
class Solution {
    func constructRectangle(_ area: Int) -> [Int] {
        let value = Int(sqrt(Double(area)))
        if area % value == 0 {
            return self.generateResult(value, area/value)
        }
        for index in value...area {
            if area % index == 0 {
                return self.generateResult(index, area/index)
            }
        }
        
        return []
    }
    
    func generateResult(_ value: Int, _ anotherValue: Int) -> [Int] {
        if value > anotherValue {
            return [value,anotherValue]
        }
        return [anotherValue,value]
    }
}

// 测试用例
var solution = Solution()
print(solution.constructRectangle(8))
print(solution.constructRectangle(99))
