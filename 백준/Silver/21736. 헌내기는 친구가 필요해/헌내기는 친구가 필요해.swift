import Foundation

let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
let x = xy[0]
let y = xy[1]

let dx=[-1,0,1,0]
let dy=[0,1,0,-1]

var board = [[String]]()
var ch = Array(repeating: Array(repeating: 0, count: y), count: x)
//print(ch)
for _ in 0..<x{
    let a = readLine()!.map{String($0)}
    board.append(a)
}
//print(board)
var dq = [(Int,Int)]()
for i in 0..<y{
    for j in 0..<x{
        if board[j][i] == "I"{
            dq.append((j,i))
            ch[j][i] = 1
            break
        }
    }
    if dq.count == 1{
        break
    }
}
var result = 0
var cnt = 0
while true{
    if cnt >= dq.count{
        break
    }
    let point = dq[cnt]
    cnt+=1
    let tx = point.0
    let ty = point.1
    
    for i in 0..<4{
        let xx = tx + dx[i]
        let yy = ty + dy[i]
        if 0 <= xx && xx < x && 0 <= yy && yy < y && ch[xx][yy] == 0 && board[xx][yy] != "X"{
            dq.append((xx,yy))
            ch[xx][yy] = 1
            if board[xx][yy] == "P"{
                result += 1
            }
        }
    }
}

if result == 0 {
    print("TT")
}else{
    print(result)
}
