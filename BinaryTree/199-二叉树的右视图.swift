/*
 199-二叉树的右视图
 题目所要找的，可以理解为是二叉树每一层最右侧的结点
 既然找每层最右侧的结点，因此遍历的时候，可以先遍历右子树，再遍历左子树
 这样，就可以把右子树的结点加入，也就是每一层最右侧的结点
 另外，因为涉及到层数，因此深度搜索的时候，需要加上层数信息
 结果只加入每层的第一个结点
 
 */
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func rightSideView(_ root:TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        if root?.left == nil && root?.right == nil {
            return [root!.val]
        }
        
        var ans: [Int] = []
        dfs(root, 0, &ans)
        return ans
    }
    
    
    func dfs(_ root: TreeNode?, _ depth: Int, _ ans: inout [Int]) {
        if root == nil {
            return
        }
        
        if depth == ans.count {
            // 只取每层的第一个结点
            ans.append(root!.val)
        }
        let newDepth = depth + 1
        // 先遍历右子树
        dfs(root?.right, newDepth, &ans)
        // 再遍历左子树
        dfs(root?.left,newDepth,&ans)
    }
}


// 测试用例
let four = TreeNode(4,nil,nil)
let three = TreeNode(3,nil,four)
let five = TreeNode(5,nil,nil)
let two = TreeNode(2,nil,five)
let root = TreeNode(1,two,three)

var solution = Solution()
print(solution.rightSideView(root))
