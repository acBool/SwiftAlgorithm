/*
 二叉搜索树的范围和
 题目比较简单，中序遍历二叉搜索树得到的是一个有序数组，遍历即可
 
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
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        if root == nil {
            return 0
        }
        var numArray: [Int] = []
        dfsBST(root, &numArray)
        var sum: Int = 0
        for value in numArray {
            if value >= low && value <= high {
                sum += value
            }
        }
        return sum
    }
    
    func dfsBST(_ root: TreeNode?, _ array: inout [Int]) {
        if root == nil {
            return
        }
        dfsBST(root?.left, &array)
        array.append(root!.val)
        dfsBST(root?.right, &array)
    }
}
