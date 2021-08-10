/*
 路径总和：判断从根节点到叶子结点上，所有结点值的和是否等于一个数
 
 思路：本题适合用深度优先搜索解决。所谓深搜，就是沿着一条路走，一直都到没有路为止
 
 结合递归的思想写代码
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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        
        let currentSum = targetSum - root!.val
        if currentSum == 0 && root?.left == nil && root?.right == nil {
            return true
        }
        // 深搜，沿着左子树一直查找。如果找不到，回退结点，沿着右子树找
        let flag1 = self.hasPathSum(root?.left, currentSum)
        let flag2 = self.hasPathSum(root?.right, currentSum)
        return flag1 || flag2
    }
}
