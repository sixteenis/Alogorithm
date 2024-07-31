import Foundation
var t = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = t[0]
var m = t[1]
var board: [[Int]] = []
var dx=[0,0,-1,1,1,1,-1,-1]
var dy=[-1,1,0,0,-1,1,1,-1]

var bb:[(Int,Int,Int)] = []
for _ in 0..<n{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(a)
}
for i in 0..<n{
    for j in 0..<m{
        bb.append((board[i][j],i,j))
    }
}
bb.sort(by: {$0.0 > $1.0})
//print(bb)
var ch = Array(repeating: [Int](repeating: 0, count: m), count: n)


var result = 0

for i in bb{
    if ch[i.1][i.2]==0{
        result+=1
        bfs(i.1,i.2,i.0)
        //print(i)
//            for j in ch{
//                print(j)
//            }
//        print("--------------")
    }
}
//bb.removeFirst()
func bfs(_ x:Int, _ y:Int, _ num:Int){
    var arr: [(Int,Int,Int)] = [(x,y,num)]
    //ch[x][y]=1
    while !arr.isEmpty{
        //print(arr)
        let tmp = arr.removeFirst()
        ch[tmp.0][tmp.1] = 1 // ?방문 한대를 또 방문가능?
        for k in 0...7{
            let xx = tmp.0 + dx[k]
            let yy = tmp.1 + dy[k]
            
            if xx>=0 && xx<n && yy>=0 && yy<m && ch[xx][yy] == 0 && board[xx][yy] <= tmp.2{
                ch[xx][yy]=1
                arr.append((xx,yy,board[xx][yy]))
                
//                print(xx,yy)
//                print("---------")
            }
                
        }
    }//while
//    for x in ch{
//        print(x)
//    }
//    print("------------")

    
}
//6,2  , 0,6  0,0

print(result)
//for x in bb{
//    print(x)
//}
//print(ch)
//-1 3 2 2 1 0 1
//3 3 3 2 1 0 1
//2 2 2 2 1 0 0
//2 1 1 1 1 0 0
//1 1 0 0 0 1 0
//0 0 0 1 1 1 0
//0 1 2 2 1 1 0
//0 1 1 1 2 1 0
