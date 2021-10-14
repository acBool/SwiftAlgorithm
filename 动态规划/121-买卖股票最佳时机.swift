/*
 买卖股票最佳时机
 使用动态规划解决。
 动态规划的做题步骤：
 1. 明确dp[i]应该表示什么
 2. 根据dp[i]和dp[i-1]的关系得到状态转移方程
 3. 确定初始条件，也就是dp[0]
 
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        
        // profitArray[i] 表示的是第i天卖出时，能够获取到的最大利润
        // minPrice表示截止到第i天，最低的价格
        // profitArray[i] = max(profitArray[i - 1], price[i] - minPrice)
        var minPrice: Int = prices[0]
        var profitArray: [Int] = Array(repeating: 0, count: prices.count)
        for index in 1..<prices.count {
            let price = prices[index]
            minPrice = min(minPrice,price)
            profitArray[index] = max(profitArray[index - 1],price - minPrice)
        }
        
        // 直接返回最后一个值即可，最后的值就是最大的收益
        return profitArray[prices.count - 1]
    }
}
