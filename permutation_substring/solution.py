from collections import defaultdict

# Solution 1: HashMap Sliding Window
class Solution:
    def checkInclusion(self, string1: str, string2: str) -> bool:
        if len(string1) > len(string2):
            return False

        string1Map = defaultdict(int)
        string2Map = defaultdict(int)
        for i in range(len(string1)):
            string1Map[string1[i]] += 1
            string2Map[string2[i]] += 1

        for i in range(0,len(string2)-len(string1)):
            if self.characterCountsMatch(string1Map,string2Map):
                return True
            string2Map[string2[i]] -= 1
            string2Map[string2[i+len(string1)]] += 1

        return self.characterCountsMatch(string1Map,string2Map)

    def characterCountsMatch(self, firstMap, secondMap):
        for char in firstMap.keys():
            if firstMap[char] != secondMap[char]:
                return False
        return True
