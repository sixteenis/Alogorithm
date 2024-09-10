import Foundation


let n = Int(readLine()!)!

var board: [[Int]] = []

for _ in 0..<n{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(a)
}

var result: [Int] = []
func solution(x: Int, y: Int, n: Int){
    let color = board[x][y]
    for i in x..<x+n{
        for j in y..<y+n{
            if color != board[i][j] {
                solution(x: x, y: y, n: n/2)
                solution(x: x, y: y + (n / 2), n: n/2)
                solution(x: x + (n / 2), y: y, n: n/2)
                solution(x: x + (n / 2), y: y + (n / 2), n: n/2)
                return
            }
        }
    }
    if color == 0{
        result.append(0)
    
    }else{
        result.append(1)
    }
}

solution(x: 0, y: 0, n: n)
var zoreNum = 0
var oneNum = 0

for i in result{
    if i == 0{
        zoreNum += 1
    }else{
        oneNum += 1
    }
}

print(zoreNum)
print(oneNum)
