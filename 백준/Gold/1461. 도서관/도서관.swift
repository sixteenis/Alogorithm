import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}

let n = nm[0]
let m = nm[1]
var bookLocal = readLine()!.split(separator: " ").map{Int(String($0))!}



var plusArr: [Int] = []
var minusArr: [Int] = []
for x in bookLocal{
    if x > 0 {
        plusArr.append(x)
    }else{
        minusArr.append(abs(x))
    }
}

var maxArr: [Int] = []
var minArr: [Int] = []
if plusArr.isEmpty {
    maxArr = minusArr
}else if minusArr.isEmpty{
    maxArr = plusArr
}else{
    if plusArr.max()! > minusArr.max()!{
        maxArr = plusArr
        minArr = minusArr
    }else{
        maxArr = minusArr
        minArr = plusArr
    }
}
maxArr.sort()
minArr.sort()
var work = 0
//print(maxArr)
//print(minArr)
let maxCount = maxArr.count
while true {
    //print(work)
    if minArr.isEmpty && maxArr.isEmpty{
        print(work)
        break
    }
    if !minArr.isEmpty{
        for j in 0..<m {
            if minArr.isEmpty{
                break
            }
            if j == 0{
                work += minArr.removeLast()*2
            }else if !minArr.isEmpty{
                minArr.removeLast()
            }
            
            
        }
    }else{
        for j in 0..<m {
            if maxArr.isEmpty{
                break
            }
            if maxCount == maxArr.count{
                work += maxArr.removeLast()
            }else{
                if j == 0 {
                    work += maxArr.removeLast()*2
                }else if !maxArr.isEmpty {
                    maxArr.removeLast()
                }
                
                
            }
            
            
        }
    }
    
}
