/*
 二叉树最大深度
 思路：
 比较简单，找到左子树的最大深度，右子树的最大深度，取较大的值，加1返回即可
 
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
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        // 左右子树均为空，返回1
        if root!.left == nil && root!.right == nil {
            return 1
        }
        
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
