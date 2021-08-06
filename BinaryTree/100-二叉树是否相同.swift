/*
 判断两颗二叉树是否相同
 
 思路：
 因为二叉树本身就是递归的结构，所以这道题也考虑使用递归解决
 判断两颗二叉树是否相同，只要两颗树的左子树相同 && 两颗树的右子树相同 && 两棵树根节点的值相同 即可
 依据该思路，使用递归，解决问题
 
 注意：
 1. 两颗空的二叉树，也是相同的二叉树
 */
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init() {
        val = 0
        left = nil
        right = nil
    }
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // 两者都是空结点，相等
        if p == nil && q == nil {
            return true
        }
        
        if p != nil && q != nil {
            // 两者都不为空，比较结点
            let flag1 = isSameTree(p?.left, q?.left)
            let flag2 = p?.val == q?.val
            let flag3 = isSameTree(p?.right, q?.right)
            return flag1 && flag2 && flag3
        }else {
            // 一个为空，一个不为空，不相等，返回false
            return false
        }
    }
}

//// 测试用例
var threeNode = TreeNode(3,nil,nil)

var twoNode = TreeNode()
twoNode.val = 2
twoNode.right = nil
twoNode.left = nil

var oneNode = TreeNode()
oneNode.val = 1
oneNode.left = twoNode
oneNode.right = nil

var fourNode = TreeNode(1,nil,twoNode)

var solution = Solution()
print(solution.isSameTree(oneNode, fourNode))


print(solution.isSameTree(nil, nil))
