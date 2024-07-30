import Foundation

var r = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = r[0]
var k = r[1]
//var n = 1000000
//var k = 5
var a = 1
var result = 0

while n>=a{ //1 , 2 , 4
    a*=2
}
a/=2
//print(a)
var list:[Int] = []

while a > 0{

    if n >= a{
        n=n-a
        list.append(a)
    }
    a/=2
    
}
//print(list)

if list.count > k {
    for i in stride(from: list.count-1, to: k-1, by: -1){

        result += (list[i-1]-list[i])
        list[i-1] = list[i-1]*2
    }

}
//print(list)
print(result)
