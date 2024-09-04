import Foundation

let n = Int(readLine()!)!

var arr: [(Int,Int)] = []

for i in 0..<n{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append((a[1],a[2]))
}

arr.sort(by: {$0.0 < $1.0 })
//print(arr)
var room = [arr[0].1]
//[(2, 14), (3, 8), (6, 27), (6, 20), (7, 13), (12, 18), (15, 21), (20, 25)]
for i in 1..<n{
    var bool = false
    for j in 0..<room.count{
        if arr[i].0 >= room[j]{
            room[j] = arr[i].1
            bool = true
            break
        }
        
        
    }
    if !bool{
        room.append(arr[i].1)
    }
}

print(room.count)
