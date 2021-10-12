/*
 二叉搜索树第k大结点
 二叉搜索树中序遍历后，得到的是升序数组。直接返回第K大即可。
 
 */
class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Solution {
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var ans: [Int] = []
        
        midOrderTree(root, &ans)
        
        return ans[ans.count - 1 - (k - 1)]
    }
    
    func midOrderTree(_ root: TreeNode?, _ ans: inout [Int]) {
        if root == nil {
            return
        }
        
        midOrderTree(root?.left, &ans)
        ans.append(root!.val)
        midOrderTree(root?.right, &ans)
    }
}
