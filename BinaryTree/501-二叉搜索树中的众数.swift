/*
 二叉搜索树中的众数
 找到二叉搜索树中哪个数出现的次数最多。注意，出现最多的数可能不止一个
 思路：
 和数组中有道题比较像。
 1. 中序遍历二叉树，得到所有的数
 2. 利用字典，统计每个数出现的次数，并记录最大的次数是多少
 3. 遍历字典，找到所有值等于最大次数的key即可
 
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
    func findMode(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var elementArray : [Int] = []
        self.midOrderTree(root, &elementArray)
        var dict: [Int:Int] = [:]
        var maxCnt = 0
        
        for i in 0...elementArray.count - 1 {
            let key = elementArray[i]
            if let value = dict[key]{
                dict[key] = value + 1
            }else{
                dict[key] = 1
            }
            if dict[key]! > maxCnt {
                maxCnt = dict[key]!
            }
        }
        // 再循环一次，找到所有元素
        var ansArray: [Int] = []
        for key in dict.keys {
            if dict[key]! == maxCnt {
                ansArray.append(key)
            }
        }
        return ansArray
    }
    
    func midOrderTree(_ root: TreeNode?,_ array: inout [Int]) {
        if root == nil {
            return
        }
        midOrderTree(root?.left, &array)
        array.append(root!.val)
        midOrderTree(root?.right,&array)
    }
}
