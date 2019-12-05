import UIKit

class Node {
    
    private var data: Int
    private var next: Node?
    
    init(data: Int, next: Node?) {
        self.data = data
        self.next = next
    }
    
    func setData(data: Int) {
        self.data = data
    }
    
    func getData() -> Int {
        return data
    }
    
    func setNextNode(node: Node) {
        self.next = node
    }
    
    func getNextNode() -> Node? {
        return next
    }
}

class LinkedList {
    
    private var head: Node?
    private var tail: Node?
    
    init(head: Node?) {
        self.head = head
        self.tail = head
    }
    
    func getFirst() -> Node? {
        return head
    }
    
    func getLast() -> Node? {
        return tail
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func push(newData: Int) {
        let newNode = Node(data: newData, next: head)
        self.head = newNode
    }
    
    func insert(after previousNode: Node, newData: Int)   {
        let newNode = Node(data: newData, next: previousNode.getNextNode())
        previousNode.setNextNode(node: newNode)
    }
    
    func append(newData: Int) {
        let newNode = Node(data: newData, next: nil)
        if let tailNode = tail {
            tailNode.setNextNode(node: newNode)
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    func printList() {
        var currentNode = head
        while let node = currentNode {
            print("Node data: \(node.getData())")
            currentNode = node.getNextNode()
        }
    }
}



// Test Data

let firstNode = Node(data: 5, next: nil)
let linkedList = LinkedList(head: firstNode)

linkedList.push(newData: 42)

linkedList.insert(after: firstNode, newData: 18)

linkedList.printList()
