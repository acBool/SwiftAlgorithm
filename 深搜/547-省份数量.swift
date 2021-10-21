/*
 省份数量
 深度优先搜索。假设1和3相连，那么从3开始搜索，假设3和5相连，再从5开始搜索，一直找到没有相连的，就是一个省份
 注意：深度优先搜索，通常需要利用一个数组标识某个点是否被访问过。
 本题用一个一维数组标识某个城市是否被访问过
 
 */
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let citiyNum = isConnected[0].count
        if citiyNum == 0 {
            return 0
        }
        var citiyVisit: [Bool] = Array(repeating: false, count: citiyNum)
        
        var province = 0
        for i in 0..<citiyNum {
            if !citiyVisit[i] {
                // 说明第i个城市没有被访问过
                province += 1
                dfs(isConnected, &citiyVisit, i)
            }
        }
        
        return province
    }
    
    
    func dfs(_ isConnected: [[Int]], _ citiyVisit: inout [Bool],_ index: Int) {
        // 将第index个城市设置为已访问
        citiyVisit[index] = true
        
        let citiyNum = isConnected[0].count
        for j in 0..<citiyNum {
            if isConnected[index][j] == 1 && !citiyVisit[j] {
                // 为1，且没有被访问过
                dfs(isConnected,&citiyVisit,j)
            }
        }
    }
}
