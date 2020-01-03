import UIKit

class Search {
    
    private var data: [Int]
    
    init(data: [Int]) {
        self.data = data
    }
    
    func binarySearch(for value: Int) -> Bool {
        
        var left = 0
        var right = data.count - 1
        
        while left <= right {
            
            let middle = Int(floor(Double((left + right) / 2)))
            
            if data[middle] < value {
                left = middle + 1
            } else if data[middle] > value {
                right = middle - 1
            } else {
                return true
            }
        }
        
        return false
    }
}

let search = Search(data: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
print("\(search.binarySearch(for: 1))")
