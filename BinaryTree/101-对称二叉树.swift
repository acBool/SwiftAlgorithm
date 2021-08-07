/*
 判断二叉树是否是对称二叉树
 思路：
 所谓对称二叉树，就是右子树翻转后，和左子树一样。根据该逻辑，采用以下判断逻辑：
 1. 翻转根节点右子树（翻转二叉树）
 2. 判断根节点的左子树和翻转后的右子树是否是相同树（判断树是否相同）
 
 上述方法能够解决问题，不过代码量比较大。后来看了下讨论区，有代码量更小的解法。
 思路：
 翻转二叉树，就是结点的左子树和同一层结点的右子树相等；结点的右子树和同一层结点的左子树相等
 根据以上逻辑，递归解决该问题。判断结点相等，其实就是判断结点的值相等。
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


//class Solution {
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        if root == nil {
//            return true
//        }
//
//        // 如果左子树、右子树均为空，返回true
//        if root!.left == nil && root!.right == nil {
//            return true
//        }
//
//        // 如果左子树、右子树均不为空，判断值
//        if root!.left != nil && root!.right != nil {
//            // 1. 翻转右子树
//            let newRight = self.invertTree(root!.right)
//            // 2. 判断左子树和新的右子树是否相同
//            return isSameTree(root!.left, newRight)
//        }
//
//        // 剩余情况，左右子树一个为空，一个不为空，返回false
//        return false
//    }
//
//    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//        // 两者都是空结点，相等
//        if p == nil && q == nil {
//            return true
//        }
//
//        if p != nil && q != nil {
//            // 两者都不为空，比较结点
//            let flag1 = isSameTree(p?.left, q?.left)
//            let flag2 = p?.val == q?.val
//            let flag3 = isSameTree(p?.right, q?.right)
//            return flag1 && flag2 && flag3
//        }else {
//            // 一个为空，一个不为空，不相等，返回false
//            return false
//        }
//    }
//
//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        if root == nil {
//            return root
//        }
//        // 左右子树均为空
//        if root!.left == nil && root!.right == nil {
//            return root
//        }
//
//        var left = invertTree(root!.left)
//        var right = invertTree(root!.right)
//        swapTwoNode(leftNode: &left, rightNode: &right)
//        root?.left = left
//        root?.right = right
//
//        return root
//    }
//
//    func swapTwoNode(leftNode: inout TreeNode?, rightNode: inout TreeNode?) {
//        let tempNode = leftNode
//        leftNode = rightNode
//        rightNode = tempNode
//    }
//}

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isReverseTree(root?.left, root?.right)
    }
    
    // 判断左右两颗子树是否是对称二叉树
    func isReverseTree(_ left: TreeNode?, _ right: TreeNode?) -> Bool{
        // 如果两棵树都为空，返回tre
        if left == nil && right == nil {
            return true
        }
        
        // 一颗为空，一颗不为空
        if left == nil || right == nil {
            return false
        }
        
        // 两颗都不为空，先判断值
        if left!.val != right!.val {
            return false
        }
        
        return isReverseTree(left!.left, right!.right) && isReverseTree(left!.right, right!.left)
    }
}
