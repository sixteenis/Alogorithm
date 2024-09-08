import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var board: [[String]] = []
let dx=[-1,0,1,0]
let dy=[0,1,0,-1]

for _ in 0..<n {
    let a = readLine()!.map{String($0)}
    board.append(a)
}
//var headch = Array(repeating: [Int](repeating: 0, count: m), count: n) //2차원배열생성
var ch = Array(repeating: [Int](repeating: 0, count: m), count: n) //2차원배열생성
//(x , y ) = ( n , m )
var result = false

func dfs(x:Int, y: Int, s: String, t: [(Int,Int)]){
   // print(x,y)
    if result == true {
        return
    }
    for i in 0..<4{
        let xx = x + dx[i]
        let yy = y + dy[i]
        if 0 <= xx && xx < n && 0 <= yy && yy < m && ch[xx][yy] == 0 && board[xx][yy] == s{
            ch[xx][yy] = 1
            for x in t {
                if x.0 == xx && x.1 == yy{
                    result = true
                    return
                }
            }
            dfs(x: xx, y: yy, s: s, t: t)
        }
    }
}

for i in 0..<n{
    for j in 0..<m{
        if ch[i][j] == 0{
//            let resx = i
//            let resy = j
            let str = board[i][j]
            var tmp: [(Int,Int)] = []
            ch[i][j] = 1
            for q in 0..<4 {
                let x = i + dx[q]
                let y = j + dy[q]
                
                if 0 <= x && x < n && 0 <= y && y < m && ch[x][y] == 0 && board[x][y] == str{
                    tmp.append((x,y))
                    
                }
                
            }
            if tmp.count >= 2 {
//                for qd in ch{
//                    print(qd)
//                }
//                print(tmp)
                let a = tmp.removeLast()
                //print(tmp)
                dfs(x: a.0, y: a.1, s: str, t: tmp)
            }

                ch[i][j] = 1
        }
        if result {
            break
        }
    }
    if result {
        break
    }
}
if result{
    print("Yes")
}else{
    print("No")
}
