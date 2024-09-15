import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
let dx=[-1,0,1,0]
let dy=[0,1,0,-1]
var board = [[String]]()

for _ in 0..<n {
    let a = readLine()!.map{String($0)}
    board.append(a)
}

var result = [Int]()
for i in 0..<n{
    for j in 0..<m {
        var ch = Array(repeating: [Int](repeating: -1, count: m), count: n)
        var dq = [(Int,Int)]()
        var maxInt = [Int]()
        if board[i][j] == "L"{
            dq.append((i,j))
            ch[i][j] = 0
        }
        while !dq.isEmpty{
            let tmp = dq.removeFirst()
            
            for q in 0..<4{
                let xx = tmp.0 + dx[q]
                let yy = tmp.1 + dy[q]
                if 0 <= xx && xx < n && 0 <= yy && yy < m && ch[xx][yy] == -1 && board[xx][yy] == "L" {
                    ch[xx][yy] = ch[tmp.0][tmp.1] + 1
                    dq.append((xx,yy))
                    
                }
                
            }
        }
        var mm = 0
        for a in ch {
            let b = a.max()!
            if b > mm {
                mm = b
            }
        }
        result.append(mm)
    }
}
print(result.max()!)
