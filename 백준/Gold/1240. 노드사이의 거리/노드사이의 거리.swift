import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = nm[0]
var m = nm[1]
var graph = Array(repeating: [Int](repeating: 0, count: n+1), count: n+1)//2차원배열생성
var ch = Array(repeating: 0, count: n+1) // 1차원 배열 생성
var result: [Int] = []
func dfs(x: Int, y: Int, sum: Int){
    if x == y{
        result.append(sum)
    }
    for i in 0...n{
        if ch[i] == 0 && graph[x][i] != 0{
            ch[i]=1
            dfs(x: i, y: y, sum: sum+graph[x][i])
            ch[i]=0
        }
    }
    
}
for _ in 0..<n-1{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[a[0]][a[1]] = a[2]
    graph[a[1]][a[0]] = a[2]
    
}

//print(graph)
for _ in 0..<m{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    ch[a[0]] = 1
    dfs(x: a[0], y: a[1], sum: 0)
    ch[a[0]] = 0
    
}
for i in result{
    print(i)
}
