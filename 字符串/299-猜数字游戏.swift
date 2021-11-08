/*
 299-猜数字游戏
 这道题使用暴力的方法也能通过
 先循环一次，找到同位置相等的，也就是公牛的数量。同时，把同位置不想等的记录下来，存到两个数组中
 第二次双重循环，依次判断，同时不断的删除字符即可，确保已经找到的不会第二次用到
 
 */
class Solution {
    func getHint(_ secert: String, _ guess: String) -> String {
        let secertArray: [Character] = Array(secert)
        let guessArray: [Character] = Array(guess)
        var bullCnt: Int = 0
        var cowCnt: Int = 0
        var cowSecertArray: [Character] = []
        var cowGuessArray: [Character] = []
        
        // 先找到公牛数量
        for i in 0..<secertArray.count {
            if secertArray[i] == guessArray[i] {
                bullCnt += 1
            }else{
                cowSecertArray.append(secertArray[i])
                cowGuessArray.append(guessArray[i])
            }
        }
        
        for i in 0..<cowSecertArray.count {
            var findIndex = -1
            for j in 0..<cowGuessArray.count {
                if cowGuessArray[j] == cowSecertArray[i] {
                    // 找到了相等的，母牛数量加1
                    cowCnt += 1
                    findIndex = j
                    break
                }
            }
            if findIndex >= 0 {
                cowGuessArray.remove(at: findIndex)
            }
        }
        
        return String(bullCnt) + "A" + String(cowCnt) + "B"
        
    }
}

// 测试用例
var solution = Solution()
print(solution.getHint("1807", "7810"))
print(solution.getHint("1123", "0111"))
print(solution.getHint("1", "0"))
print(solution.getHint("1", "1"))
