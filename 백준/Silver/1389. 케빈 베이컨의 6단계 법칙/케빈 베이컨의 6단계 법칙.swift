import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var board = Array(repeating: Array(repeating: 0, count: n), count: n)
for _ in 0..<m {
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    board[a[0]-1][a[1]-1] = 1
    board[a[1]-1][a[0]-1] = 1
}
//var cnt = 999999
//for x in board{
//    print(x)
//}
var min = 99999
var result = Array(repeating: 0, count: n)
for i in 0..<n {
    var ch = Array(repeating: -1, count: n)
    var dq = [Int]()
    ch[i] = 0
    var cnt = 1
    for j in 0..<n{
        if board[i][j] == 1{
            //dq.append((i,j))
            dq.append(j)
            ch[j] = 1
            cnt += 1
            
        }
    }
    while true{
        let x = dq.removeFirst()
        for q in 0..<n{
            if board[x][q] == 1 && ch[q] == -1{
                dq.append(q)
                ch[q] = ch[x] + 1
                cnt += 1
            }
        }
        if cnt == n{
            break
        }
    }
    //print(ch)
    let a = ch.reduce(0) { $0 + $1 }
    result[i] = a
    if a < min {
        min = a
    }
    
}
for i in 0..<result.count{
    if result[i] == min{
        print(i+1)
        break
    }
}
