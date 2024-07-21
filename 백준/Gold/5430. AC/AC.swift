import Foundation

let turn = Int(readLine()!)!

for _ in 0..<turn {
    let f = readLine()!.map{String($0)}
    var tail = Int(readLine()!)!
    let arr = readLine()!.dropFirst().dropLast().split(separator: ",").map { String($0) }
    var isRevers = false
    var head = 0
    for f in f {
        if f == "R" {
            isRevers.toggle()
            continue
        }
        if isRevers {
            tail -= 1
        } else{
            head += 1
        }
        if head > tail {break}
    }
    
    if head > tail {
        print("error")
    } else {
        if isRevers {
            print("[\(arr[head..<tail].reversed().joined(separator: ","))]")
        }else{
            print("[\(arr[head..<tail].joined(separator: ","))]")
        }
    }
}