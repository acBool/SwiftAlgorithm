/*
 翻转二叉树
 思路：
 二叉树本身就是递归结构，因此利用递归解决该问题
 翻转二叉树，其实就是将一颗树的左右结点交换。由此，得到问题思路：
 1. 翻转左子树
 2. 翻转右子树
 3. 根节点交换左右子树
 
 交换两个结点时，用到了swift中的inout关键字
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
    
    init(_ val: Int, _ left: TreeNode? , _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        // 左右子树均为空
        if root!.left == nil && root!.right == nil {
            return root
        }
        
        var left = invertTree(root!.left)
        var right = invertTree(root!.right)
        swapTwoNode(leftNode: &left, rightNode: &right)
        root?.left = left
        root?.right = right
        
        return root
    }
    
    func swapTwoNode(leftNode: inout TreeNode?, rightNode: inout TreeNode?) {
        let tempNode = leftNode
        leftNode = rightNode
        rightNode = tempNode
    }
}