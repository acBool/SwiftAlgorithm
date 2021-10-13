/*
 斐波那契数列，题目简单，可以用来练习递归
 
 */
class Solution {
    func fib(_ n : Int) -> Int {
        if n == 0 {
            return 0
        }else if n == 1 {
            return 1
        }else {
            return fib(n - 1) + fib(n - 2)
        }
    }
}