import UIKit

func confusionMatrix(hit: Int, miss: Int, falseAlarm: Int, correctRejection: Int) -> (accuracy: Double, sensitivity: Double, specificity: Double, fallout: Double, positivePredictiveValue: Double, negativePredictiveValue: Double, falseDiscovery: Double, missRate: Double) {
    return (
        accuracy(hit: hit, miss: miss, falseAlarm: falseAlarm, correctRejection: correctRejection),
        sensitivity(hit: hit, miss: miss),
        specificity(falseAlarm: falseAlarm, correctRejection: correctRejection),
        fallout(falseAlarm: falseAlarm, correctRejection: correctRejection),
        positivePredictiveValue(hit: hit, falseAlarm: falseAlarm),
        negativePredictiveValue(miss: miss, correctRejection: correctRejection),
        falseDiscovery(hit: hit, falseAlarm: falseAlarm),
        missRate(hit: hit, miss: miss)
    )
}

private func accuracy(hit: Int, miss: Int, falseAlarm: Int, correctRejection: Int) -> Double {
    let numerator = Double(hit + correctRejection)
    let denominator = Double(hit + correctRejection + falseAlarm + miss)
    return round(numerator: numerator, denominator: denominator)
}

private func sensitivity(hit: Int, miss: Int) -> Double {
    let numerator = Double(hit)
    let denominator = Double(hit + miss)
    return round(numerator: numerator, denominator: denominator)
}

private func specificity(falseAlarm: Int, correctRejection: Int) -> Double {
    let numerator = Double(correctRejection)
    let denominator = Double(correctRejection + falseAlarm)
    return round(numerator: numerator, denominator: denominator)
}

private func fallout(falseAlarm: Int, correctRejection: Int) -> Double {
    let numerator = Double(falseAlarm)
    let denominator = Double(falseAlarm + correctRejection)
    return round(numerator: numerator, denominator: denominator)
}

private func positivePredictiveValue(hit: Int, falseAlarm: Int) -> Double {
    let numerator = Double(hit)
    let denominator = Double(hit + falseAlarm)
    return round(numerator: numerator, denominator: denominator)
}

private func negativePredictiveValue(miss: Int, correctRejection: Int) -> Double {
    let numerator = Double(correctRejection)
    let denominator = Double(correctRejection + miss)
    return round(numerator: numerator, denominator: denominator)
}

private func falseDiscovery(hit: Int, falseAlarm: Int) -> Double {
    let numerator = Double(falseAlarm)
    let denominator = Double(hit + falseAlarm)
    return round(numerator: numerator, denominator: denominator)
}

private func missRate(hit: Int, miss: Int) -> Double {
    let numerator = Double(miss)
    let denominator = Double(hit + miss)
    return round(numerator: numerator, denominator: denominator)
}

private func round(numerator: Double, denominator: Double) -> Double {
    return Double(round(100 * (numerator / denominator * 100)) / 100)
}


// Test Input
let data = confusionMatrix(hit: 95, miss: 1, falseAlarm: 4, correctRejection: 3)

print("--------------------------------------------\n")
print("Accuracy: \(data.accuracy) %\n")
print("Sensitivity: \(data.sensitivity) %\n")
print("Specificity: \(data.specificity) %\n")
print("Fallout: \(data.fallout) %\n")
print("Positive Predictive Value: \(data.positivePredictiveValue) %\n")
print("Negative Predictive Value: \(data.negativePredictiveValue) %\n")
print("False Discovery: \(data.falseDiscovery) %\n")
print("Miss Rate: \(data.missRate) %\n")
print("--------------------------------------------")
