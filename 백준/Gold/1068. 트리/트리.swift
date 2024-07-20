import Foundation
var n=Int(readLine()!)!
var arr=readLine()!.split(separator: " ").map{Int(String($0))!}
var m=Int(readLine()!)!
var a = 0
var result:[(Int,Int)] = []
func dfs(_ x: Int){
    if x==n{
        return
    }else{
        result.append((a, arr[x]))
        a+=1
        dfs(x+1)
    }
}
dfs(0)
var tmpArr:[(Int, Int)] = []
var count:[Int] = []
for i in result{
    if i.0 != m && i.1 != m{
        tmpArr.append((i.0,i.1))
    }else if i.1 == m{
        count.append(i.0)
    }
    result=tmpArr
            
}
//print(result)
//print(count)
while !count.isEmpty{
    var tmp=count[0]
    var ttmpArr:[(Int, Int)]=[]
    count.remove(at: 0)
    for i in result{
        if i.1 != tmp{
            ttmpArr.append((i.0,i.1))
        }else{
            count.append(i.0)
        }
    }
    result=ttmpArr
}
//print(result)

var cnt=0
if result.count != 0{
    var t = result[0].0
    var rr=result.count
    for i in 0..<rr{
        //var tttmp = result[i].0
        var tcnt=0
        for j in 0..<rr{
            if result[i].0 == result[j].1{
                tcnt+=1
            }
            
        }
        if tcnt==0{
            cnt+=1
        }
    }
}

//print(rr)

print(cnt)
