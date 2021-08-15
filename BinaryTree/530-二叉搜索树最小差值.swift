/*
 二叉搜索树中的最小差值
 思路：
 题目说了是二叉搜索树，因此中序遍历可以得到一个有序数组
 求任意两个结点的最小差值，因为是有序数组，所以从前往后依次遍历，相邻两个做差值就行
 
 */
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var valueArray: [Int] = []
        self.midOrderTree(root, &valueArray)
        if valueArray.count < 2 {
            return valueArray[0]
        }
        
        var ans = Int.max,preValue = valueArray[0]
        for i in 1...valueArray.count - 1 {
            if valueArray[i] - preValue < ans {
                ans = valueArray[i] - preValue
            }
            preValue = valueArray[i]
        }
        return ans
    }
    
    func midOrderTree(_ root: TreeNode?, _ array: inout [Int]) {
        if root == nil {
            return
        }
        self.midOrderTree(root?.left, &array)
        array.append(root!.val)
        self.midOrderTree(root?.right, &array)
    }
}
