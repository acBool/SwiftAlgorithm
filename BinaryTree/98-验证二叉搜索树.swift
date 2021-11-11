/*
 98-验证二叉搜索树
 判断一颗二叉树是否是二叉搜索树，比较简单
 先中序遍历，得到遍历数组后，判断是否是严格升序即可
 
 */
class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if root?.left == nil && root?.right == nil {
            return true
        }
        
        var ans: [Int] = []
        midOrderTree(root: root, ansArray: &ans)
        var flag = true
        for i in 0..<ans.count - 1 {
            if ans[i] >= ans[i + 1] {
                flag = false
                break
            }
        }
        
        return flag
    }
    
    
    func midOrderTree(root: TreeNode?, ansArray: inout [Int]) {
        if root == nil {
            return
        }
        midOrderTree(root: root?.left, ansArray: &ansArray)
        ansArray.append(root!.val)
        midOrderTree(root: root?.right, ansArray: &ansArray)
    }
    
}

// 测试用例
var left = TreeNode(1,nil,nil)
var right = TreeNode(3,nil,nil)
var root = TreeNode(2,left,right)
var solution = Solution()
print(solution.isValidBST(root))
