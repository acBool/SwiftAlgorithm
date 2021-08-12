/*
 二叉搜索树转为链表
 思路：
 1. 二叉搜索树中序遍历后，得到的是一个有序的数组
 2. 可以用数组降二叉搜索树中序遍历后的结点都存起来
 3. 从头开始遍历数组，将结点的左子树置为nil，右子树指向下一个结点
 
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
    var treeNodeArray : [TreeNode?] = []
    
    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        if root?.left == nil && root?.right == nil {
            return root
        }
        
        self.midOrderTree(root)
        
        if treeNodeArray.count > 0 {
            let newRoot = treeNodeArray[0]
            var preNode = newRoot
            var currentNode: TreeNode? = nil
            // 上面已经判断过，因此这里不会越界，没有问题
            for index in 1...treeNodeArray.count-1 {
                currentNode = treeNodeArray[index]
                currentNode?.left = nil
                preNode?.left = nil
                preNode?.right = currentNode
                preNode = currentNode
            }
            return newRoot
        }else{
            return root
        }
        
    }
    
    func midOrderTree(_ root: TreeNode?) {
        if root == nil {
            return
        }
        midOrderTree(root?.left)
        treeNodeArray.append(root)
        midOrderTree(root?.right)
    }
}
