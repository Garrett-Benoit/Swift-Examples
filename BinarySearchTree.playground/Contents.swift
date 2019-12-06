import UIKit

class Node {
    
    var data: Int
    var left: Node?
    var right: Node?
    
    init(data: Int) {
        self.data = data
    }
}

class BinarySearchTree {
    
    var root: Node?
    
    init() {
        // Initializing an empty BST
    }
    
    func search(forValue data: Int) {
        searchHelper(node: root, data: data)
    }
    
    private func searchHelper(node: Node?, data: Int) {
        if let node = node {
            if node.data == data {
                print("Value \(data) found in tree")
            } else if node.data > data {
                // Left
                searchHelper(node: node.left, data: data)
            } else {
                // Right
                searchHelper(node: node.right, data: data)
            }
        }
    }
    
    func insert(data: Int) {
        if let root = root {
            insertHelper(node: root, data: data)
        } else {
            root = Node(data: data)
        }
    }
    
    private func insertHelper(node: Node?, data: Int) -> Node {
        if let node = node {
            if node.data > data {
                node.left = insertHelper(node: node.left, data: data)
            } else {
                node.right = insertHelper(node: node.right, data: data)
            }
            return node
        } else {
            return Node(data: data)
        }
    }
    
    func printTree() {
        printTreeInOrder(node: root)
    }
    
    private func printTreeInOrder(node: Node?) {
        if let node = node {
            printTreeInOrder(node: node.left)
            print("\(node.data)")
            printTreeInOrder(node: node.right)
        }
    }
}



// Test Data
let testTree = BinarySearchTree()
testTree.insert(data: 50)
testTree.insert(data: 30)
testTree.insert(data: 20)
testTree.insert(data: 40)
testTree.insert(data: 70)
testTree.insert(data: 60)
testTree.insert(data: 80)

testTree.printTree()
print("---------------------")
testTree.search(forValue: 40)
