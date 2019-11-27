import UIKit

func minMax(depth: Int, nodeIndex: Int, maximize: Bool, values: [Int], alpha: Int, beta: Int) -> Int {
    
    if depth == 3 {
        return values[nodeIndex]
    }
    
    if maximize {
        var best = -1000
        var alpha = alpha
        var i = 0
        
        while i < 2 {
            
            let val = minMax(depth: depth + 1, nodeIndex: nodeIndex * 2 + i, maximize: false, values: values, alpha: alpha, beta: beta)
            
            best = best > val ? best : val
            alpha = alpha > best ? alpha : best
            
            if beta <= alpha { break }
            
            i += 1
        }
        
        return best
    } else {
        var best = 1000
        var beta = beta
        var i = 0
        
        while i < 2 {
            
            let val = minMax(depth: depth + 1, nodeIndex: nodeIndex * 2 + i, maximize: true, values: values, alpha: alpha, beta: beta)
            
            best = best > val ? val : best
            beta = beta > best ? best : beta
            
            if beta <= alpha { break }
            
            i += 1
        }
        
        return best
    }
}


// Test Data

let optimalValue = minMax(depth: 0, nodeIndex: 0, maximize: true, values: [3, 5, 6, 9, 1, 2, 0, -1], alpha: -1000, beta: 1000)
print("Optimal: \(optimalValue)")
