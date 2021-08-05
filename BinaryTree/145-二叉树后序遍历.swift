/*
 后续遍历二叉树
 二叉树遍历的特点是：无论是前序、中序、还是后序，左侧子树永远在右侧子树前面
 后序遍历，父结点在后面，输出是： 左节点、右结点、父结点
 
 思路：
 利用递归的思想（二叉树本身就是一个递归的结构）：
 1. 遍历左子树
 2. 遍历右子树
 3. 将父节点添加到数组中
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
    
    init(_ val: Int,_ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var ansArray: [Int] = []
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if let tRoot = root {
            postorderTraversal(tRoot.left)
            postorderTraversal(tRoot.right)
            ansArray.append(tRoot.val)
        }else{
            // root为空，直接返回
            return ansArray
        }
        return ansArray
    }
}

//// 测试用例
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
print(solution.postorderTraversal(oneNode))
