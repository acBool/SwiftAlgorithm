/*
 423 - 从英文中重建数字
 这道题是模拟题，本质上是找唯一
 比如'z'只在“zero”中出现，“x”只在“six”中出现，“g”只在“eight”中出现
 依次类推，按序处理即可。
 代码写的比较繁琐，实际上不需要，只需要依次判断唯一字符即可，不需要将单词中的每个字符都判断
 
 */
class Solution {
    func originalDigits(_ s: String) -> String {
        var dict:[Character: Int] = [:]
        let array = Array(s)
        for char in array {
            dict[char] = (dict[char] ?? 0) + 1
        }
        //print(dict)
        var ans = ""
        let zero = addZero(&dict) // z
        let six = addSix(&dict) // x
        let eight = addEight(&dict) // g
        let two = addTwo(&dict) // w
        let four = addFour(&dict) // u
        let three = addThree(&dict) // h
        let seven = addSeven(&dict) // s
        let five = addFive(&dict) // v
        let nine = addNine(&dict) // i
        let one = addOne(&dict)
        return ans + zero + one + two + three + four + five + six + seven + eight + nine
    }
    
    func addZero(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["z"] ?? 0) > 0 && (dict["e"] ?? 0) > 0 && (dict["r"] ?? 0) > 0 && (dict["o"] ?? 0) > 0){
            ans = ans + "0"
            dict["z"]! -= 1
            dict["e"]! -= 1
            dict["r"]! -= 1
            dict["o"]! -= 1
        }
        return ans
    }
    
    func addOne(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["o"] ?? 0) > 0 && (dict["n"] ?? 0) > 0 && (dict["e"] ?? 0) > 0){
            ans = ans + "1"
            dict["o"]! -= 1
            dict["n"]! -= 1
            dict["e"]! -= 1
        }
        return ans
    }
    
    func addTwo(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["t"] ?? 0) > 0 && (dict["w"] ?? 0) > 0 && (dict["o"] ?? 0) > 0){
            ans = ans + "2"
            dict["t"]! -= 1
            dict["w"]! -= 1
            dict["o"]! -= 1
        }
        return ans
    }
    
    func addThree(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["t"] ?? 0) > 0 && (dict["h"] ?? 0) > 0 && (dict["r"] ?? 0) > 0 && (dict["e"] ?? 0) > 1 ){
            ans = ans + "3"
            dict["t"]! -= 1
            dict["h"]! -= 1
            dict["r"]! -= 1
            dict["e"]! -= 2
        }
        return ans
    }
    
    func addFour(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["f"] ?? 0) > 0 && (dict["o"] ?? 0) > 0 && (dict["u"] ?? 0) > 0 && (dict["r"] ?? 0) > 0){
            ans = ans + "4"
            dict["f"]! -= 1
            dict["o"]! -= 1
            dict["u"]! -= 1
            dict["r"]! -= 1
        }
        return ans
    }
    
    func addFive(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["f"] ?? 0) > 0 && (dict["i"] ?? 0) > 0 && (dict["v"] ?? 0) > 0 && (dict["e"] ?? 0) > 0){
            ans = ans + "5"
            dict["f"]! -= 1
            dict["i"]! -= 1
            dict["v"]! -= 1
            dict["e"]! -= 1
        }
        return ans
    }
    
    func addSix(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["s"] ?? 0) > 0 && (dict["i"] ?? 0) > 0 && (dict["x"] ?? 0) > 0){
            ans = ans + "6"
            dict["s"]! -= 1
            dict["i"]! -= 1
            dict["x"]! -= 1
        }
        return ans
    }
    
    func addSeven(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["s"] ?? 0) > 0 && (dict["e"] ?? 0) > 1 && (dict["v"] ?? 0) > 0 && (dict["n"] ?? 0) > 0 ){
            ans = ans + "7"
            dict["s"]! -= 1
            dict["e"]! -= 2
            dict["v"]! -= 1
            dict["n"]! -= 1
        }
        return ans
    }
    
    func addEight(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["e"] ?? 0) > 0 && (dict["i"] ?? 0) > 0 && (dict["g"] ?? 0) > 0 && (dict["h"] ?? 0) > 0 && (dict["t"] ?? 0) > 0){
            ans = ans + "8"
            dict["e"]! -= 1
            dict["i"]! -= 1
            dict["g"]! -= 1
            dict["h"]! -= 1
            dict["t"]! -= 1
        }
        return ans
    }
    
    func addNine(_ dict: inout [Character: Int]) -> String{
        var ans = ""
        while((dict["n"] ?? 0) > 1 && (dict["i"] ?? 0) > 0 && (dict["e"] ?? 0) > 0){
            ans = ans + "9"
            dict["n"]! -= 2
            dict["i"]! -= 1
            dict["e"]! -= 1
        }
        return ans
    }
}

var solution = Solution()
//print(solution.originalDigits("owoztneoer"))
//print(solution.originalDigits("fviefuro"))
print(solution.originalDigits("zeroonetwothreefourfivesixseveneightnine"))
