import Foundation


let n = Int(readLine()!)!

var arr: [(Int, Int)] = []

for _ in 0..<n{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append((a[0],a[1]))
}

arr.sort(by: {
    if $0.1 == $1.1{
        return $0.0 < $1.1
    }else{
        return $0.1 < $1.1
    }

})

//print(arr)
var result = 1
var bigger = arr[0].1
for i in 1..<n{
    if arr[i].0 >= bigger {
        result += 1
        bigger = arr[i].1
    }
}

print(result)
