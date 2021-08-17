/*
 快排代码
 快排是一个递归的操作，思路如下：
 选择一个基准，通常为最左侧元素，将值大于基准的放到数组右侧；将值小于基准的放到数组左侧；
 不断的递归该操作
 
 关键是如果将大于基准的放到右侧，小于基准的放到左侧
 思路是采用双指针，左侧指针指向数组开头，右侧指针指向数组结尾，
 从数组右侧开始遍历，一直找到一个值比基准小的，放到left指针的位置；
 从数组左侧开始遍历，一直找到一个值比基准大的，放到right指针的位置；
 不断循环
 
 */
func partition(_ array: inout [Int],_ left: Int, _ right: Int) -> Int {
    let pivot = array[left]
    var newLeft = left, newRight = right
    while newLeft < newRight {
        while newLeft < newRight && array[newRight] >= pivot {
            newRight -= 1
        }
        array[newLeft] = array[newRight]
        
        while newLeft < newRight && array[newLeft] <= pivot {
            newLeft += 1
        }
        array[newRight] = array[newLeft]
    }
    array[newLeft] = pivot
    return newLeft
}


func quickSort(_ array: inout [Int],_ left: Int, _ right: Int) {
    let count = array.count
    if count <= 1 {
        return
    }
    var mid = 0
    if left < right {
        mid = partition(&array, left, right)
        quickSort(&array, left, mid - 1)
        quickSort(&array, mid + 1, right)
    }
}

// 测试用例
var array = [99,7,10,1,104,3,5,0,200,9]
let count = array.count
quickSort(&array, 0, count - 1)
print(array)