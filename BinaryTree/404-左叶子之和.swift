/*
 左叶子之和
 
 注意求的是所有左叶子之和，不是所有左子树之和
 叶子结点，需要判断该结点的左右子树都是空
 左结点，需要借助该结点的父结点来判断
 
 另外，不要忘记右子树，右子树上也有左叶子结点
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
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?){
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var val = 0
        
        if root == nil {
            return 0
        }
        
        if root?.left == nil && root?.right == nil {
            return 0
        }
        
        // 左子树为空，则加右子树的值
        if root?.left == nil {
            val += self.sumOfLeftLeaves(root?.right)
        }else{
            // 左子树不为空
            if root?.left?.left == nil && root?.left?.right == nil {
                // 左子树是叶子结点
                val += root!.left!.val
            }else{
                // 左子树不是叶子结点
                val += self.sumOfLeftLeaves(root?.left)
            }
            val += self.sumOfLeftLeaves(root?.right)
        }
        return val
    }
}
