import Foundation

let num = Int(readLine()!)!

var sw = readLine()!.map{Int(String($0))!}
var sw2 = sw
var resultSw = readLine()!.map{Int(String($0))!}

var result = [0,0]

func switchOn(x: Int) -> Int {
    if sw[x] == 0{
        return 1
    }else{
        return 0
    }
}
func switchOn2(x: Int) -> Int {
    if sw2[x] == 0{
        return 1
    }else{
        return 0
    }
}
for i in 0..<resultSw.count{
    if i == 0 {
        sw[i] = switchOn(x: i)
        sw[i+1] = switchOn(x: i+1)
        result[0] += 1
    }else if i == resultSw.count - 1 {
        if sw[i-1] != resultSw[i-1]{
            sw[i] = switchOn(x: i)
            sw[i-1] = switchOn(x: i-1)
            result[0] += 1
        }
        
    }
    else{
        if sw[i-1] != resultSw[i-1] {
            sw[i-1] = switchOn(x: i-1)
            sw[i] = switchOn(x: i)
            sw[i+1] = switchOn(x: i+1)
            result[0] += 1
        }
        
    }
    //print(sw)
}

for i in 1..<resultSw.count{
    if i == resultSw.count - 1 {
        if sw2[i-1] != resultSw[i-1]{
            sw2[i] = switchOn2(x: i)
            sw2[i-1] = switchOn2(x: i-1)
            result[1] += 1
        }
        
    }
    else{
        if sw2[i-1] != resultSw[i-1]{
            sw2[i-1] = switchOn2(x: i-1)
            sw2[i] = switchOn2(x: i)
            sw2[i+1] = switchOn2(x: i+1)
            result[1] += 1
        }
    }
}
//print(sw)
//print(sw2)
//print(result)
if sw == resultSw{
    if sw2 == resultSw{
        print(result.min()!)
    }else{
        print(result[0])
    }
}else if sw2 == resultSw{
    if sw == resultSw{
        print(result.min()!)
    }else{
        print(result[1])
    }
}else{
    print("-1")
}
//7
//1101000
//1111111
