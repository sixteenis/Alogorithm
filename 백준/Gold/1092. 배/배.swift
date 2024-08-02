import Foundation

var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var m = Int(readLine()!)!
var box = readLine()!.split(separator: " ").map{Int(String($0))!}

arr.sort{$0 > $1}
box.sort{$0 > $1}
var result = 0
var ch = Array(repeating: 0, count: m)
var tt = 0
if arr[0] < box[0]{
    print("-1")
}else{
    while true{
        result += 1
        var tmpArr = arr
        for i in tmpArr{
            for j in 0..<box.count{
                if box[j] <= i && ch[j]==0{
                    ch[j]=1
                    tt+=1
                    break
                }
            }
            
        }
        if tt == m{
            break
        }
        
        
    }
    print(result)
}
