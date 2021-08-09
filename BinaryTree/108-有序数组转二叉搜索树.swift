/*
 有序数组转化为二叉搜索树
 二叉搜索树：中序遍历得到的是一个有序数组
 
 根据此思想，并结合二叉树递归的思想，思考以下思路：
 1. 找到数组中间的元素，作为跟结点
 2. 数组左侧作为根结点的左子树
 3. 数组右侧作为根节点的右子树
 
 特殊判断空数组、数组只有1个元素、数组只有2个元素的情况
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
        self.val = 0
        self.left = left
        self.right = right
    }
}

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        // 空数组，返回nil
        if nums.count == 0 {
            return nil
        }
        
        // 数组只有1个元素，返回对应结点
        if nums.count == 1 {
            let node = TreeNode(nums[0],nil,nil)
            return node
        }
        
        // 数组只有两个元素
        if nums.count == 2 {
            let leftNode = TreeNode(nums[0],nil,nil)
            let node = TreeNode(nums[1],leftNode,nil)
            return node
        }
        
        // 至少3个元素，分奇数、偶数两种情况
        if nums.count % 2 == 1 {
            // 奇数
            let index = (nums.count - 1) / 2
            let leftNode = self.sortedArrayToBST(Array(nums[0..<index]))
            let rightNode = self.sortedArrayToBST(Array(nums[index+1...nums.count - 1]))
            let rootNode = TreeNode(nums[index],leftNode,rightNode)
            return rootNode
        }else{
            // 偶数
            let index = nums.count / 2
            let leftNode = self.sortedArrayToBST(Array(nums[0..<index]))
            let rightNode = self.sortedArrayToBST(Array(nums[index+1...nums.count - 1]))
            let rootNode = TreeNode(nums[index],leftNode,rightNode)
            return rootNode
        }
    }
}
