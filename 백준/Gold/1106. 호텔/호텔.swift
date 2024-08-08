import Foundation

let cn = readLine()!.split(separator: " ").map{Int(String($0))!}
var c = cn[0] // 인원
var n = cn[1] // 금액

var arr: [[Int]] = []

for _ in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!} // 첫입력 = 비용 두번째입력 = 얻는 고객수
    arr.append([input[1],input[0]])
    
}
arr.sort(by: { $0[0] > $1[0]})
//print(arr)

var dp = Array(repeating: 1000*100, count: 100001)//2차원배열생성
// 5 == 비용으로 얻을 수 있는 인원 3 == 비용
//12 2
//3 5
//1 1
//1000 1 1명일때 100비용 1000*100
for i in 0..<n{
    dp[arr[i][0]] = arr[i][1]
    for j in 1..<dp.count{
        if arr[i][0] < j{ //5이상일 때부터 들감 dp[5] = 5 j==10
            dp[j] = min(dp[j], dp[j-arr[i][0]] + arr[i][1]) //현재 dp[j] , 3 * 1 , dp[j-5] + 3  arr[i][1] * (j / arr[i][0]),
        }
    }
}


print(dp[c...100000].min()!)

