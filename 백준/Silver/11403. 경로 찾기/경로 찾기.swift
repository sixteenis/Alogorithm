import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []

for _ in 0..<n{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(a)
}
var board = Array(repeating: Array(repeating: 0, count: n), count: n)
var ch = Array(repeating: Array(repeating: 0, count: n), count: n)

func dfs(x: Int, point: Int) { //x = 1 point = 0
    for i in 0..<n{ // 0,1,2
        if arr[x][i] == 1 && ch[point][i] == 0{ // i == 2
            ch[point][i] = 1
            board[point][i] = 1 // ch[0][2]
            dfs(x: i, point: point)
            //print(i)
        }
    }
    
}
//3
//0 1 0
//0 0 1
//1 0 0
for i in 0..<n{
    for j in 0..<n{
        if arr[i][j] == 1{ //0,1
            ch[i][j] = 1
            board[i][j] = 1
            dfs(x:j, point: i)
            ch[i][j] = 0
        }
    }
}
for i in board{
    for j in i {
        print(j,terminator: " ")
    }
    print("")
}
