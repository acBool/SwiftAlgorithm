/*
 36 - 有效的数独
 模拟题目，题目没什么难点，按照题目要求，分别判断行、列、九宫格是否满足即可
 需要注意边界值
 
 */
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0...8 {
            var charRowArray: [Character] = []
            var charColArray: [Character] = []
            for j in 0...8 {
                let char = board[i][j]
                let colChar = board[j][i]
                if char != "." && charRowArray.contains(char){
                    // 行有重复的字符
                    return false
                }
                charRowArray.append(char)
                if colChar != "." && charColArray.contains(colChar){
                    // 列又重复的字符
                    return false
                }
                charColArray.append(colChar)
            }
        }
        
        // 行列符合要求，判断九宫格
        var row = 0, col = 0
        while (row <= 6 && col <= 6) {
            var array: [Character] = []
            for i in row...row+2 {
                for j in col...col+2 {
                    if board[i][j] == "."{
                        continue
                    }
                    if array.contains(board[i][j]){
                        return false
                    }
                    array.append(board[i][j])
                }
            }
            if row == 6 {
                row = 0
                col += 3
            }else{
                row += 3
            }
        }
        
        return true
    }
}

var solution = Solution()
//print(solution.isValidSudoku([[".",".","4",".",".",".","6","3","."],[".",".",".",".",".",".",".",".","."],["5",".",".",".",".",".",".","9","."],[".",".",".","5","6",".",".",".","."],["4",".","3",".",".",".",".",".","1"],[".",".",".","7",".",".",".",".","."],[".",".",".","5",".",".",".",".","."],[".",".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".",".","."]]))



print(solution.isValidSudoku([[".",".",".",".","5",".",".","1","."],[".","4",".","3",".",".",".",".","."],[".",".",".",".",".","3",".",".","1"],["8",".",".",".",".",".",".","2","."],[".",".","2",".","7",".",".",".","."],[".","1","5",".",".",".",".",".","."],[".",".",".",".",".","2",".",".","."],[".","2",".","9",".",".",".",".","."],[".",".","4",".",".",".",".",".","."]]))
