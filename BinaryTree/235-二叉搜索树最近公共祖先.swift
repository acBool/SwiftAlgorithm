/*
 二叉搜索树的最近公共祖先
 思路：
 注意题目说的是二叉搜索树，因此中序遍历后，得到的数组是有序的
 利用二叉搜索树的特点，值比跟结点小的，肯定都在根节点左侧；值比跟结点大的，肯定都在根节点右侧
 据此：如果一个结点的值大于根节点，一个结点的值小于根节点，则根节点一定就是最近公共祖先；
 如果两个结点的值都比跟结点小，那么其公共祖先一定在左子树上；
 如果两个结点的值都比跟结点大，那么其公共祖先一定在右子树上
 
 另外，注意题目条件：
 1. 每个结点值不同
 2. p、q不为空
 
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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        if p!.val < root!.val && q!.val < root!.val {
            // p、q均在根节点左侧，则最近公共祖先肯定也在左子树
            return self.lowestCommonAncestor(root?.left, p, q)
        }else if p!.val > root!.val && q!.val > root!.val {
            // p、q均在根节点右侧，则最近公共祖先肯定也在右子树
            return self.lowestCommonAncestor(root?.right, p, q)
        }else{
            // 一个在左侧，一个在右侧，root就是最近祖先
            return root
        }
    }
}
