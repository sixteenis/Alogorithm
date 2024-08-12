import Foundation
let cardNum = Int(readLine()!)!
var target = readLine()!.split(separator: " ").map{Int(String($0))!}
let mix = readLine()!.split(separator: " ").map{Int(String($0))!} //1 2 0
var card: [Int] = []
var breakNum = target
var resultNum: [Int] = []
var result = 0
for i in 0..<cardNum{
    resultNum.append(i%3)
}
//print(resultNum)
if target == resultNum{
    print("0")
}else{
    while true{ //우리는 1. 0 1 2 0 1 2 0 1 2 , target == break
        var tmp = Array(repeating: -1, count: cardNum) // 1차원 배열 생성
        for i in 0..<cardNum{
            tmp[mix[i]] = target[i] // target[1], target[2] , target [0]
        }
        if tmp == breakNum{
            print("-1")
            break
        }
        //print(target)
        result += 1
        if tmp == resultNum{
            print(result)
            break
        }
        
        
        target = tmp
        
    }
}
