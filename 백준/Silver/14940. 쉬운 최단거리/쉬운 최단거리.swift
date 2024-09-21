import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

let dx=[-1,0,1,0]
let dy=[0,1,0,-1]

var board = [[Int]]()

for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(input)
}

var ch = Array(repeating: Array(repeating: 0, count: m), count: n)
var dq = [(Int,Int)]()
var result = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n{
    for j in 0..<m{
        if board[i][j] == 2{
            dq.append((i,j))
            ch[i][j] = 1
            break
        }
    }
    if dq.count == 1{
        break
    }
}
var roop = 0
while dq.count != roop {
    let x = dq[roop].0
    let y = dq[roop].1
    roop += 1
    for i in 0...3{
        let xx = x + dx[i]
        let yy = y + dy[i]
        if 0 <= xx && xx < n && 0 <= yy && yy < m && ch[xx][yy] == 0 && board[xx][yy] != 0{
            ch[xx][yy] = 1
            dq.append((xx,yy))
            result[xx][yy] += (result[x][y] + 1)
        }
    }
}
for x in 0..<n{
    for y in 0..<m{
        if result[x][y] == 0 && board[x][y] == 1{
            result[x][y] = -1
        }
    }
}
for x in result{
    for y in x{
        print(y, terminator: " ")
    }
    print("")
}
