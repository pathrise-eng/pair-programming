
# Note: Tradeoffs of using a raw dictionary vs. a Node class?

class TrieNode:
    def __init__(self,chunk,is_word):
        self.chunk = chunk
        self.children = {}
        self.is_word = is_word

class Trie:

    def __init__(self):
        self.root = TrieNode(None,False)

    def insert(self,word):
        current_node = self.root
        for char in word:
            if char in current_node.children:
                current_node = current_node.children[char]
            else:
                current_node.children[char] = TrieNode(char,False)
                current_node = current_node.children[char]
        current_node.is_word = True

    def trie_search(self,word,is_prefix):
        current_node = self.root
        for char in word:
            if char not in current_node.children:
                return False
            else:
                current_node = current_node.children[char]
        return is_prefix or current_node.is_word

    def search(self,word):
        return trie_search(word,False)

    def starts_with(self,prefix):
        return trie_search(word,True)


