/*
 平衡二叉树
 平衡二叉树的概念是：对于树中的每一个结点，其左右子树的高度差不能超过1
 
 思路：
 根据递归的思想，很容易想到以下策略：
 1. 判断左子树是否是平衡二叉树
 2. 判断右子树是否是平衡二叉树
 3. 判断左右子树的高度差是否超过1
 
 以上思路能够解决问题，但是因为计算高度需要递归，判断平衡二叉树也需要递归，所消耗的时间比较长
 
 
 优化：因为平衡二叉树的条件就是判断左右子树的高度差不超过1，因此可以在计算高度的过程中判断结点
 是否是平衡二叉树，省去一次递归
 
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


//class Solution {
//    func isBalanced(_ root: TreeNode?) -> Bool {
//        // 空树也是平衡二叉树
//        if root == nil {
//            return true
//        }
//
//        // 左右子树都是空，也是平衡二叉树
//        if root?.left == nil && root?.right == nil {
//            return true
//        }
//
//        let flag1 = isBalanced(root?.left)
//        let height1 = self.getDepth(root?.left)
//        let flag2 = isBalanced(root?.right)
//        let height2 = self.getDepth(root?.right)
//        if flag1 && flag2 && abs(height1 - height2) <= 1 {
//            return true
//        }
//
//        return false
//    }
//
//    func getDepth(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        if root?.left == nil && root?.right == nil {
//            return 1
//        }
//
//        return max(getDepth(root?.left),getDepth(root?.right)) + 1
//    }
//}


class Solution {
    var ans = true
    func isBalanced(_ root: TreeNode?) -> Bool {
        // 空树也是平衡二叉树
        if root == nil {
            return true
        }
        
        // 左右子树都是空，也是平衡二叉树
        if root?.left == nil && root?.right == nil {
            return true
        }
        
        self.getDepth(root)
        return ans
    }
    
    func getDepth(_ root: TreeNode?) -> Int {
        if ans == false {
            return 0
        }
        
        if root == nil {
            return 0
        }
        if root?.left == nil && root?.right == nil {
            return 1
        }
        
        let height1 = getDepth(root?.left)
        let height2 = getDepth(root?.right)
        if abs(height2 - height1) > 1 {
            ans = false
        }
        
        return max(height1,height2) + 1
    }
}
