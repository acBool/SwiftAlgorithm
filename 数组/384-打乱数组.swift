/*
 384-打乱数组
 没什么难度，使用随机数就可以通过
 另外也可以使用洗牌算法，洗牌算法还是要依赖于随机数
 假设有n个数，那么对应的数组索引就是0 - n-1
 所谓洗牌算法，就是针对每一个索引x，在后续的索引[x, n - 1]
 中随机选一个索引y，将这两个索引对应的值进行交互即可
 
 */
class Solution {
    var originalNums: [Int] = []
    var length: Int = 0
    
    init(_ nums: [Int]) {
        self.originalNums = nums
        self.length = nums.count
    }
    
    func reset() -> [Int] {
        return self.originalNums
    }
    
    func shuffle() -> [Int] {
        var ans: [Int] = []
        
        while(true){
            if ans.count == self.originalNums.count {
                break
            }
            
            let index: Int = Int(arc4random()) % self.length
            if(ans.contains(self.originalNums[index]) == false){
                ans.append(self.originalNums[index])
            }
        }
        
        return ans
    }
}


// 测试用例
var solution = Solution([1,2,3,4,5])
//print(solution.reset())
print(solution.shuffle())
print(solution.shuffle())
print(solution.shuffle())
print(solution.shuffle())
print(solution.shuffle())
print(solution.shuffle())
print(solution.shuffle())
print(solution.shuffle())
//print(solution.reset())


