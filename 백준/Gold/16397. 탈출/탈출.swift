let ntg = readLine()!.split(separator: " ").map{Int(String($0))!}

var n = ntg[0] // 첫 입력
var t = ntg[1] // 최대 횟수
var g = ntg[2] // 원하는 숫자


var result = -1
var q: [Int] = []
q.append(n)
var ch = Array(repeating: false, count: 100000) // 1차원 배열 생성
for i in 0..<t{
    if n == g{
        result = 0
        break
    }
    var whileCnt = 0
    var resultCnt = false
    var qq: [Int] = []
    //print(q)
    while whileCnt != q.count{
        let tmp = q[whileCnt]
        whileCnt += 1
        let aButton = tmp + 1
        let maxButton = tmp*2
        if maxButton != 0{
            if maxButton <= 99999{ // 123
                var b = String(maxButton).map{Int(String($0))!} // [1,2,3]
                b[0] -= 1 //[0,2,3]
                var bButton = 0
                for q in b{ //
                    bButton += q //230
                    bButton *= 10
                }
                bButton /= 10 // bButton = 23
                
                if bButton == g{
                    resultCnt = true
                    break
                } else if ch[bButton] == false{
                    ch[bButton] = true
                    qq.append(bButton)
                }
                
            }
        }else{
            if ch[0] == false {
                qq.append(0)
            }
        }
        if aButton == g{
            resultCnt = true
            break
        }else if aButton < g && ch[aButton] == false && aButton <= 99999{
            ch[aButton] = true
            qq.append(aButton)
        }
        
    }
    q = qq
    //print(qq)
    if resultCnt {
        result = i+1
        break
    }
    if q.isEmpty{
        break
    }
    
    
}
if result != -1{
    print(result)
}else{
    print("ANG")
}
