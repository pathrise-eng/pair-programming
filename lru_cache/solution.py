class Node:
    def __init__(self, key, value):
        self.key = key
        self.val = value
        self.prev = None
        self.next = None

class LRUCache:
    def __init__(self, capacity):
        self.capacity = capacity
        self.dict = dict()
        self.head = Node(None, None)
        self.tail = Node(None, None)
        self.head.next = self.tail
        self.tail.prev = self.head

    def get(self, key):
        if key in self.dict:
            n = self.dict[key]
            self._remove(n)
            self._add(n)
            return n.val
        return -1

    def put(self, key, value):
        if key in self.dict:
            self._remove(self.dict[key])
        n = Node(key, value)
        self._add(n)
        self.dict[key] = n
        if len(self.dict) > self.capacity:
            last = self.tail.prev
            self._remove(n)
            del self.dict[n.key]

    def _remove(self, node):
        prevNode = node.prev
        nextNode = node.next
        prevNode.next = nextNode
        nextNode.prev = prevNode

    def _add(self, node):
        front = self.head.next
        front.prev = node
        node.next = front
        node.prev = self.head
        self.head.next = node
