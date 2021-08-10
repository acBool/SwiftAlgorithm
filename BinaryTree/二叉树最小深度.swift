/*
 二叉树最小深度
 思路上整体和二叉树最大深度差不多，唯一区别的地方在于：
 题目规定了最小深度是到叶子结点的深度，因此，如果左子树无叶子结点，需要返回右子树的深度
 
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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if root?.left == nil && root?.right == nil {
            return 1
        }
        
        let leftDepth = minDepth(root?.left)
        let rightDepth = minDepth(root?.right)
        
        let minValue = min(leftDepth,rightDepth)
        let maxValue = max(leftDepth,rightDepth)
        return minValue > 0 ? minValue + 1 : maxValue + 1
    }
}
