/*
 二叉树中序遍历
 二叉树遍历的特点是：无论是前序、中序、还是后序，左侧子树永远在右侧子树前面
 中序遍历，父结点在中间，输出是： 左节点、父节点、右结点
 
 思路：
 利用递归的思想（二叉树本身就是一个递归的结构）：
 1. 遍历左子树
 2. 将根节点添加到数组中
 3. 遍历右子树
 
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
    
    var ansArray: [Int] = []
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if let tRoot = root {
            inorderTraversal(tRoot.left)
            ansArray.append(tRoot.val)
            inorderTraversal(tRoot.right)
        }else {
            // root为空，直接返回
            return ansArray
        }
        return ansArray
    }
}

// 测试用例
var threeNode = TreeNode(3,nil,nil)

var twoNode = TreeNode()
twoNode.val = 2
twoNode.right = nil
twoNode.left = threeNode

var oneNode = TreeNode()
oneNode.val = 1
oneNode.left = nil
oneNode.right = twoNode

var solution = Solution()
print(solution.inorderTraversal(oneNode))
