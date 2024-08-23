import Foundation


let n = Int(readLine()!)!
var task: [(Int,Int)] = []
for i in 0..<n {
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    task.append((a[1],a[0]))
}

task.sort(by: {$0 < $1})
//print(task)
for i in 0...1000000 {
    var checkTrue = false // 값이 크면?
    var cnt = i
    for j in 0..<n{
        cnt += task[j].1
        if cnt > task[j].0{
            checkTrue = true
            break
        }
    }
    if checkTrue == true{
        print(i-1)
        break
    }
    
}
