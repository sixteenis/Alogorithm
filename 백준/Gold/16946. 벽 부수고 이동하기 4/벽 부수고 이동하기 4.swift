import Foundation

var num = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = num[0] // x
var m = num[1] // y
var board: [[Int]] = []
let dx=[-1,0,1,0]
let dy=[0,1,0,-1]
for _ in 0..<n{
    let a = readLine()!.map{ Int(String($0))! } // 수정된 부분
    board.append((a))
}

var zoreBoard = Array(repeating: [Int](repeating: 0, count: m), count: n)// 0의 구역과 값
//var numBoard = Array(repeating: [Int](repeating: 0, count: m), count: n)//2차원배열생성
var chNum = Array(repeating: [Bool](repeating: false, count: m), count: n)// 0 체크리스트
var result = Array(repeating: [String](repeating: "0", count: m), count: n)//2차원배열생성
var hash:[Int] = [0]
var hasNum = 0 //구역 레벨 지정
//var qq: [(Int,Int)] = [] //1부분 BFS
var oneNumArr: [(Int,Int)] = [] //시간 줄어듬...ㅠ.ㅠ....

for i in 0..<n{
    for j in 0..<m{
        //var ch = Array(repeating: [Int](repeating: 0, count: m), count: n)//2차원배열생성
        var cnt = 0 //구역에 크기
        var zoreCount: [(Int,Int)] = [] //구역크기 정하면 zoreBoard에 값 넣는 용
        
        if board[i][j] == 0 && !chNum[i][j]{
            var Q: [(Int,Int)] = [] //0부분 BFS
            Q.append((i,j))
            cnt+=1
            chNum[i][j]=true
            hasNum+=1
            zoreCount.append((i,j))
            zoreBoard[i][j]=hasNum
            //ch[i][j]=1
            //result
            var index = 0
            while true{
                //let tmp = Q[0]
                //Q.ㅑ
                if index == Q.count{break}
                let tmp = Q[index]
                index += 1
                //print(tmp)
                for o in 0...3{
                    let xx = tmp.0 + dx[o]
                    let yy = tmp.1 + dy[o]
                    if 0 <= xx && xx < n && 0 <= yy && yy < m && board[xx][yy] == 0 && !chNum[xx][yy]{
                        chNum[xx][yy]=true
                        cnt+=1
                        Q.append((xx,yy))
                        zoreCount.append((xx,yy)) // 0 x ,y좌표 넣어줌
                        zoreBoard[xx][yy] = hasNum
                    }
                    
                    
                }
                
                    
                    
                
            }
            
        }
        
        else if board[i][j] == 1{
            oneNumArr.append((i,j)) //100 100
            
        }
        if cnt != 0{
            hash.append(cnt)
        }
        
        
        
        
        
    }
}
//print(zoreBoard)
//print(hash)
//print(oneNumArr)
//for i in zoreBoard{
//    print(i)
//}

for i in oneNumArr{
    var ttt=0
        var t:[Int] = [] // 겹치는 구역이 있는지 확인
        for q in 0...3{ //상하좌우
            let xx = i.0 + dx[q]
            let yy = i.1 + dy[q]
            if 0 <= xx && xx < n && 0 <= yy && yy < m && board[xx][yy] == 0 && !t.contains(zoreBoard[xx][yy]){
                ttt += (hash[zoreBoard[xx][yy]])
                t.append(zoreBoard[xx][yy])
            }
            
            
        }
        ttt += 1
        result[i.0][i.1] = String(ttt % 10)
    
}

//for i in zoreBoard{
//    print(i)
//}
//print(result)
for i in result{
    print(i.joined(separator: ""))
}
