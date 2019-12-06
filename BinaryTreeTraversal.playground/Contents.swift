import UIKit

class Node {
    
    let data: Int
    var left: Node?
    var right: Node?
    
    init(data: Int) {
        self.data = data
    }
}

class BinaryTree {
    
    var root: Node?
    
    init() {
        
    }
    
    private func inOrderTraversal(node: Node?) {
        if let node = node {
            
            if let leftNode = node.left {
                inOrderTraversal(node: leftNode)
            }
            
            print("\(node.data)")
            
            if let rightNode = node.right {
                inOrderTraversal(node: rightNode)
            }
        }
    }
    
    private func preOrderTraversal(node: Node?) {
        if let node = node {
            
            print("\(node.data)")
            
            if let leftNode = node.left {
                preOrderTraversal(node: leftNode)
            }
            
            if let rightNode = node.right {
                preOrderTraversal(node: rightNode)
            }
        }
    }
    
    private func postOrderTraversal(node: Node?) {
        if let node = node {
            
            if let leftNode = node.left {
                postOrderTraversal(node: leftNode)
            }
            
            if let rightNode = node.right {
                postOrderTraversal(node: rightNode)
            }
            
            print("\(node.data)")
        }
    }
    
    func inOrderTraversal() { inOrderTraversal(node: root) }
    func preOrderTraversal() { preOrderTraversal(node: root) }
    func postOrderTraversal() { postOrderTraversal(node: root) }
}



// Test Data

let testTree = BinaryTree()

testTree.root = Node(data: 1)
testTree.root?.left = Node(data: 2)
testTree.root?.right = Node(data: 3)
testTree.root?.left?.left = Node(data: 4)
testTree.root?.left?.right = Node(data: 5)

print("----------------------")
print("In Order")
testTree.inOrderTraversal()
print("----------------------")
print("Pre Order")
testTree.preOrderTraversal()
print("----------------------")
print("Post Order")
testTree.postOrderTraversal()
