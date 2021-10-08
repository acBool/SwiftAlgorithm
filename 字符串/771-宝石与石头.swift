/*
 宝石与石头，题目比较简单，一次循环即可
 如果有效率问题，也可以使用字典将jewels元素存起来
 
 */
class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jewArray = Array(jewels)
        let stonArray = Array(stones)
        var cnt: Int = 0
        for index in 0...stonArray.count - 1 {
            if jewArray.contains(stonArray[index]) {
                cnt += 1
            }
        }
        return cnt
    }
}