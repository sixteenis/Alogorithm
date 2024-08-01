import Foundation

var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}

func slope(x1: Int, y1: Int, x2: Int, y2: Int) -> Double{
//    if y1 - y2 == 0 || x1 - x2 == 0{
//        return 0
//    }else{
        return Double(y1 - y2) / Double(x1 - x2)
    //}
}
var result = 0

for i in 0..<n{ //0 ~ 14까지 진행
    var tmp = 0
    var lslopetmp = -Double.infinity // 2.0
    var rslopetmp = Double.infinity
    for j in i+1..<n{ // 오른쪽 기준에 비해 높이가 낮으면 +, 높이가 높으면 -  감소  5
        let x2 = j
        let y2 = arr[j]
        let t = slope(x1: i, y1: arr[i], x2: x2, y2: y2) // 기울기             4
        if t > lslopetmp{ // 음수 5- 6 y1 - y2  높이가 높으면 양수 +9999999 -2.0
            tmp+=1
            lslopetmp = t
        }

        
        
    }
    for j in stride(from: i-1, to: -1, by: -1){ // 왼쪽 기준에 비해 높이가 낮으면 -, 높이가 높으면 +  증가
        let x2 = j
        let y2 = arr[j]
        let t = slope(x1: i, y1: arr[i], x2: x2, y2: y2)
        if t < rslopetmp{
            tmp+=1
            rslopetmp = t
        }
        
    }
    
    
    if tmp > result{
        result = tmp
    }
    
}
print(result)
