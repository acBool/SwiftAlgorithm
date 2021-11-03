/*
 17-电话号码的字母组合
 因为题目说了digits的长度在0-4之间，因此可以用枚举+暴力的方法来做
 是可以通过的
 
 */
//class Solution {
//    func letterCombinations(_ digits: String) -> [String] {
//        if digits.count == 0 {
//            return []
//        }
//        let dict: [Character : String] = ["2":"abc","3":"def","4":"ghi","5":"jkl","6":"mno","7":"pqrs","8":"tuv","9":"wxyz"]
//        var ans: [String] = []
//
//        let array = Array(digits)
//        var strArray : [String] = []
//        for char in array {
//            let str = dict[char]
//            if str != nil {
//                strArray.append(str!)
//            }
//        }
//
//        let totalCount = strArray.count
//        if totalCount == 1 {
//            self.createOneAns(strArray[0], &ans)
//        }else if totalCount == 2 {
//            self.createTwoAns(strArray[0], strArray[1], &ans)
//        }else if totalCount == 3 {
//            self.createThreeAns(strArray[0], strArray[1], strArray[2], &ans)
//        }else {
//            self.createFourAns(strArray[0], strArray[1], strArray[2], strArray[3], &ans)
//        }
//
//        return ans
//    }
//
//    func createOneAns(_ str: String, _ ans: inout [String]) {
//        let array = Array(str)
//        for char in array {
//            ans.append(String(char))
//        }
//    }
//
//    func createTwoAns(_ str1: String, _ str2: String, _ ans: inout [String]) {
//        let array1 = Array(str1)
//        let array2 = Array(str2)
//        for char1 in array1 {
//            for char2 in array2 {
//                ans.append(String(char1) + String(char2))
//            }
//        }
//    }
//
//    func createThreeAns(_ str1: String, _ str2: String, _ str3: String, _ ans: inout [String]) {
//        let array1 = Array(str1)
//        let array2 = Array(str2)
//        let array3 = Array(str3)
//        for char1 in array1 {
//            for char2 in array2 {
//                for char3 in array3 {
//                    ans.append(String(char1) + String(char2) + String(char3))
//                }
//            }
//        }
//    }
//
//    func createFourAns(_ str1: String, _ str2: String, _ str3: String, _ str4: String, _ ans: inout [String]) {
//        let array1 = Array(str1)
//        let array2 = Array(str2)
//        let array3 = Array(str3)
//        let array4 = Array(str4)
//        for char1 in array1 {
//            for char2 in array2 {
//                for char3 in array3 {
//                    for char4 in array4 {
//                        ans.append(String(char1) + String(char2) + String(char3) + String(char4))
//                    }
//                }
//            }
//        }
//    }
//}


/*
 另外就是使用回溯法。一般求全部排列组合的题目，都可以考虑回溯法
 回溯法其实是搜索的一种变体：满足条件继续搜，不满足条件，回退，然后再搜
 因为本题没有什么限制条件，所有的情况都是满足条件的，因此本题的写法实际上也是一种搜索
 
 */
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        
        let dict : [Character : [Character]] = ["2": ["a","b","c"],
                                            "3":["d","e","f"],
                                            "4":["g","h","i"],
                                            "5":["j","k","l"],
                                            "6":["m","n","o"],
                                            "7":["p","q","r","s"],
                                            "8":["t","u","v"],
                                            "9":["w","x","y","z"]]
        
        var strArray: [[Character]] = []
        for char in digits {
            if dict[char] != nil {
                strArray.append(dict[char]!)
            }
        }
        
        var ans: [String] = []
        backTrace("", strArray, 0, &ans)
        
        return ans
    }
    
    
    func backTrace(_ combineStr: String, _ strArray:[[Character]], _ index: Int, _ ans: inout [String]) {
        if index >= strArray.count {
            ans.append(combineStr)
            return
        }
        
        let charArray = strArray[index]
        for char in charArray {
            let tempStr = combineStr + String(char)
            backTrace(tempStr, strArray, index + 1, &ans)
        }
    }
}

var solution = Solution()
print(solution.letterCombinations("234"))
