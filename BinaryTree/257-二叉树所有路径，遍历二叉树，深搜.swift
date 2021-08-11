/*
 二叉树的所有路径
 打印二叉树的所有路径，思路：利用深搜+栈
 
 顺着一条路径搜索，一直搜到叶子结点停止，此时栈中的元素就是一条路径，拼接完路径后注意删除栈顶元素
 回溯的时候，将左右两颗子树搜索完毕后，注意要删除栈顶元素
 
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

class Solution {
    var ansString: [String] = []
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        
        var valArray: [String] = []
        self.dfsBinaryTree(root,&valArray)
        return ansString
    }
    
    
    func dfsBinaryTree(_ root: TreeNode?,_ valArray: inout [String]) {
        if root == nil {
            return
        }
        
        if root?.left == nil && root?.right == nil {
            // 说明到了叶子结点
            valArray.append(String(root!.val))
            // 拼接字符串
            let ans = valArray.joined(separator: "->")
            self.ansString.append(ans)
            // 移除尾部元素
            valArray.removeLast()
        }else{
            valArray.append(String(root!.val))
            self.dfsBinaryTree(root?.left,&valArray)
            self.dfsBinaryTree(root?.right,&valArray)
            // 移除尾部元素
            valArray.removeLast()
        }
        
    }
    
}

// 测试用例
var fiveNode = TreeNode(5,nil,nil)
var twoNode = TreeNode(2,nil,fiveNode)
var threeNode = TreeNode(3,nil,nil)
var oneNode = TreeNode(1,twoNode,threeNode)

var solution = Solution()
print(solution.binaryTreePaths(oneNode))