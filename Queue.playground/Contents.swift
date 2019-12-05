import UIKit

class Node {
    
    var data: Int
    var next: Node?
    
    init(data: Int, next: Node?) {
        self.data = data
        self.next = next
    }
}

class Queue {
    
    var front: Node?
    var rear: Node?
    
    init() {
        // Initializing an empty queue
    }
    
    func enqueue(data: Int) {
        let newNode = Node(data: data, next: nil)
        if let rear = rear {
            rear.next = newNode
            self.rear = newNode
        } else {
            // Nothing in queue
            front = newNode
            rear = newNode
        }
    }
    
    func dequeue() -> Node? {
        if let front = front, let nextNode = front.next {
            self.front = nextNode
            return front
        } else {
            print("Queue is empty")
            front = nil
            rear = nil
            return nil
        }
    }
    
    func printQueue() {
        var currentNode = front
        print("Queue data:")
        while let node = currentNode {
            print("\(node.data)")
            currentNode = node.next
        }
    }
}



// Test Data

let queue = Queue()
queue.enqueue(data: 12)
queue.enqueue(data: 15)
queue.enqueue(data: 8)
queue.enqueue(data: 7)
queue.enqueue(data: 19)
queue.enqueue(data: 25)

queue.printQueue()

print("-----------------------------")
let dequeuedValueOne = queue.dequeue()
print("Dequeued \(dequeuedValueOne?.data)")

print("-----------------------------")
let dequeuedValueTwo = queue.dequeue()
print("Dequeued \(dequeuedValueTwo?.data)")

print("-----------------------------")
queue.printQueue()
