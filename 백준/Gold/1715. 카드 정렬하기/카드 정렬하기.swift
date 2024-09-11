import Foundation

struct Heap<T: Comparable> {
    var list = [T]()
    var comparer : (T,T) -> Bool
    
    init(comparer : @escaping (T,T)->Bool) {
        self.comparer = comparer
    }
    mutating func insert(_ x : T ) {
        var idx = list.count
        list.append(x)
        
        while idx > 0 , comparer(list[(idx-1)/2], list[idx]) {
            list.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
        }
    }
    
    mutating func delete() -> T? {
        if list.isEmpty { return nil }
        list.swapAt(0, list.count-1)
        let willDelete = list.removeLast()
        var idx = 0
        var change = -1
        
        while idx < list.count {
            for i in 2*idx+1...2*idx+2 {
                if i < list.count && comparer(list[idx], list[i]) {
                    if change == -1 ||  comparer(list[change], list[i])  {
                        change = i
                    }
                }
            }
            if change == -1 {break}
            list.swapAt(idx, change)
            idx = change
            change = -1
        }
        return willDelete
    }
    
    var isEmpty : Bool {
        return list.isEmpty
    }
}


let N = Int(readLine()!)!
var heap = Heap<Int>(comparer: >)
for _ in 0..<N {
    heap.insert(Int(readLine()!)!)
}
var sum = 0
while !heap.isEmpty {
    let a = heap.delete()
    let b = heap.delete()
    if b == nil {
        break
    }
    sum += (a!+b!)
    heap.insert(a!+b!)
}
print(sum)

