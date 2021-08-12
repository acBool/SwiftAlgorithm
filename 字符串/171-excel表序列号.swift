/*
 Excel表序列号
 本质上就是26进制，没什么难点
 注意字符串相关的API
 
 */
class Solution {
    
    var dict: [String: Int] = ["A":1,"B":2,"C":3,"D":4,"E":5,"F":6,"G":7,"H":8,"I":9
                               ,"J":10,"K":11,"L":12,"M":13,"N":14,"O":15,"P":16
                               ,"Q":17,"R":18,"S":19,"T":20,"U":21,"V":22,"W":23,"X":24,"Y":25,"Z":26]
    
    func titleToNumber(_ columnTitle: String) -> Int {
        let length = columnTitle.count
        if length == 0 {
            return 0
        }
        
        var ans = 0
        var pow = 1,index = 0
        while index < length - 1 {
            pow *= 26
            index += 1
        }
        
        for (_,v) in columnTitle.enumerated() {
            let a = dict[String(v.description)]
            ans += (a! * pow)
            pow /= 26
        }
        return ans
    }
}

