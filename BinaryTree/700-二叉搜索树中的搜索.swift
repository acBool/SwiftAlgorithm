/*
 二叉搜索树中的搜索
 题目比较简单，因为二叉搜索树满足根节点大于左子树，小于右子树，因此实际上就是类似于二分查找
 如果和根节点相等，直接返回根节点
 如果大于根节点，使用右子树继续寻找
 如果小于根节点，使用左子树继续寻找
 
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return root
        }
        
        if root!.val == val {
            return root
        }else if root!.val > val {
            return searchBST(root?.left, val)
        }else {
            return searchBST(root?.right, val)
        }
    }
}
