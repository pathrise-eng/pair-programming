from collections import defaultdict

def buildFreqHash(array):
    freq = defaultdict(int)
    for item in array:
        freq[item] += 1
    return freq


class Solution:
   def topKFrequent(self, words: List[str], k: int) -> List[str]:
        frequencies = buildFreqHash(words)
        heap = []
        for word, freq in frequencies.items():
            heap.append((-freq,word))
        heapq.heapify(heap)
        result = []
        for i in range(k):
            result.append(heapq.heappop(heap)[1])
        return result
