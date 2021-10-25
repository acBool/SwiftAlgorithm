/*
 240-搜索二维矩阵
 解析：题目比较简单，因为每行、每列都是升序的，因此可以针对单行、单列使用二分查找
 外面加一层循环就可以
 
 */
//class Solution {
//    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//        if matrix.count == 0 {
//            return false
//        }
//
//        let column = matrix[0].count
//        let row = matrix.count
//        for index in 0..<row {
//            let flag = self.midSearch(matrix, index, column, target)
//            if flag {
//                return flag
//            }
//        }
//        return false
//    }
//
//
//    func midSearch(_ matrix: [[Int]], _ row: Int,_ column: Int, _ target: Int) -> Bool {
//        var left = 0, right = column - 1, mid = 0
//        while left <= right {
//            mid = (left + right) / 2
//            if matrix[row][mid] == target {
//                return true
//            }else if matrix[row][mid] < target {
//                left = mid + 1
//            }else {
//                right = mid - 1
//            }
//        }
//        return false
//    }
//}


/*
 下面这种方法是Z字形法，从右上角开始遍历，每次可以排除一行或者一列
 如果matrix[x][y] > target，因为行是升序，说明target只能在其左侧，因此直接排除一列；
 如果matrix[x][y] < target，因为列是升序，说明target只能在其下册，因此直接排除一行；
 相比于二分法，效率上稍微要高一些
 
 */
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count - 1,col = matrix[0].count - 1
        var x = 0,y = col
        while x <= row && y >= 0 {
            if matrix[x][y] == target {
                return true
            }else if matrix[x][y] > target {
                y -= 1
            }else {
                x += 1
            }
        }
        return false
    }
}
