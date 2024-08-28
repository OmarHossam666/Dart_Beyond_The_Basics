void main()
{
    List <int> numbers = [2 , 4 , 6 , 8 , 10];
    print(numbers);

    List <double> decimalNumbers = [1 , 3 , 5 , 7 , 9];
    print(decimalNumbers);

    List <String> snacks = ['chips' , 'nuts'];
    print(snacks);

    List <bool> flags = [true , false];
    print(flags);

    List <Object> anyType = ['Omar' , 66 , 3.14 , true];
    print(anyType);

    final intTree = createIntTree();
    print(intTree.value); // 7

    final stringTree = createStringTree();
    print(stringTree.value); // seven

    final doubleTree = createDoubleTree();
    print(doubleTree.value); // 7.0

    final tree = createTree(['one' , 'two' , 'three']);
    print(tree?.value); // 1
    print(tree?.leftChild?.value); // 2
    print(tree?.rightChild?.value); // 3
    print(tree?.rightChild?.rightChild?.value); // null

    final binarySearchTree = BinarySearchTree<num>();
    binarySearchTree.insert(7);
    binarySearchTree.insert(1);
    binarySearchTree.insert(9);
    binarySearchTree.insert(0);
    binarySearchTree.insert(5);
    binarySearchTree.insert(8);

    print(binarySearchTree);

    // challenge 01
    final stack = Stack <int> ();
    stack.push(1);
    stack.push(2);
    stack.push(3);

    stack.pop();

    stack.push(3);
    print(stack);

    print("Top: ${stack.peek()}");
    print(stack.isEmpty());

    // Challenge 02
    final stringStack = Stack <String> ();

    stringStack.push("Omar");
    stringStack.push("Hossam");
    stringStack.push("Fathey");

    print(stringStack);
    print("Top: ${stringStack.peek()}");
    print("isEmpty: ${stringStack.isEmpty()}");
    
    stringStack.pop();
    print(stringStack);
}

class Node <T>
{
    Node(this.value);

    T value;
    Node <T>? leftChild;
    Node <T>? rightChild;

    @override
    String toString()
    {
        final left = leftChild?.toString() ?? '';
        final parent = value.toString();
        final right = rightChild?.toString() ?? '';
        return '$left $parent $right';
    }
}

class BinarySearchTree <E extends Comparable <E>>
{
    Node <E>? root;

    void insert(E value)
    {
        root = _insertAt(root , value);
    }

    Node <E> _insertAt(Node <E>? node , E value)
    {
        // Base Case
        if (node == null)
        {
            return Node(value);
        }

        // Searching The BST to find an empty child
        if (value.compareTo(node.value) < 0)
        {
            node.leftChild = _insertAt(node.leftChild , value);
        }
        else
        {
            node.rightChild = _insertAt(node.rightChild , value);
        }

        // Returning the root node after completing the search
        return node;
    }

    @override
    String toString() => root.toString();
}

Node <E>? createTree <E> (List <E> nodes , [int index = 0])
{
    // Base Case
    if (index >= nodes.length) return null;

    // The Parent Node
    final node = Node(nodes[index]);

    // Children Index
    final leftChildIndex = 2 * index + 1;
    final rightChildIndex = 2 * index + 2;

    // Creating left child and right child nodes using recursion
    node.leftChild = createTree(nodes , leftChildIndex);
    node.rightChild = createTree(nodes , rightChildIndex);

    // Returning the root node
    return node;
}

class IntNode
{
    IntNode(this.value);

    int value;
    IntNode? leftChild;
    IntNode? rightChild;
}

Node <int> createIntTree()
{
    final seven = Node(7);
    final one = Node(1);
    final zero = Node(0);
    final five = Node(5);
    final nine = Node(9);
    final eight = Node(8);

    seven.leftChild = one;
    one.leftChild = zero;
    one.rightChild = five;
    seven.rightChild = nine;
    nine.leftChild = eight;

    return seven;
}

class StringNode
{
    StringNode(this.value);

    String value;
    StringNode? leftChild;
    StringNode? rightChild;
}

Node <String> createStringTree()
{
    final seven = Node('seven');
    final one = Node('one');
    final zero = Node('zero');
    final five = Node('five');
    final nine = Node('nine');
    final eight = Node('eight');

    seven.leftChild = one;
    one.leftChild = zero;
    one.rightChild = five;
    seven.rightChild = nine;
    nine.leftChild = eight;

    return seven;
}

class DoubleNode
{
    DoubleNode(this.value);

    double value;
    DoubleNode? leftChild;
    DoubleNode? rightChild;
}

Node <double> createDoubleTree()
{
    final seven = Node(7.0);
    final one = Node(1.0);
    final zero = Node(0.0);
    final five = Node(5.0);
    final nine = Node(9.0);
    final eight = Node(8.0);

    seven.leftChild = one;
    one.leftChild = zero;
    one.rightChild = five;
    seven.rightChild = nine;
    nine.leftChild = eight;

    return seven;
}

class Stack <E>
{
    Stack([List <E>? stack]) : stack = stack ?? [];

    List <E> stack;
    int top = 0;

    void push(E element) => stack.insert(top , element);

    E pop()
    {
        E topElement = stack.first;
        stack.removeAt(top);
        return topElement;
    }

    E peek() => stack.isNotEmpty ? stack[top] : stack.single;

    bool isEmpty() => stack.isEmpty ? true : false;

    @override
    String toString()
    {
        final result = StringBuffer();

        for (final value in stack)
        {
            result.write(value);
            if (value != stack.last)
            {
                result.write('\n');
            }
        }

        return result.toString();
    }
}