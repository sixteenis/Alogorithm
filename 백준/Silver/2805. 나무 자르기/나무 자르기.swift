import Foundation


let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n,m) = (input[0], input[1])


let tree = readLine()!.split(separator: " ").compactMap { Int($0) }

var start = 0
var end = tree.max()!


var minReulst = 0
while (start <= end) {
    let mid = (start + end) / 2
    var result = 0
    
    for i in tree {
        if i - mid > 0 {
            result += i - mid
        }
    }
//    print(result, mid)
//    if result == m {
//        end = mid - 1
//        maxReulst = mid
//    }
//    else
    if result < m {
        //원하는 트리보다 작을 경우 전단기 크기 줄이기
        end = mid - 1
    } else {
        start = mid + 1
        if result > 0 {
            minReulst = max(minReulst, mid)
        }
    }
}


print(minReulst)