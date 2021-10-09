/*
 合并二叉树
 思路：如果某个结点为空，直接返回另一个结点即可。当两个结点都不为空时，将两个结点的值相加；
 同时，还需要遍历左子树、右子树
 递归实现
 
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
    
    public init(_ val: Int,_ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil {
            return root2
        }
        
        if root2 == nil {
            return root1
        }
        
        return self.generateNode(root1, root2)
    }
    
    func generateNode(_ node1: TreeNode?, _ node2: TreeNode?) -> TreeNode? {
        if node1 == nil {
            return node2
        }
        
        if node2 == nil {
            return node1
        }
        
        let node = TreeNode(node1!.val + node2!.val,nil,nil)
        node.left = generateNode(node1?.left, node2?.left)
        node.right = generateNode(node1?.right, node2?.right)
        return node
    }
}
