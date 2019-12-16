'''

Ransom Note
Given an arbitrary ransom note string and then an array for strings representing the entire contents of different individual magazines, write a function that will return the index of the magazine (if any) that can be used to make the ransom note. If no magazine. If no single magazine can be used, return -1.

Each letter in the magazine string can only be used once in your ransom note.

magazines = ['this is magazine one', 'mag two', 'i want to make this new tiny magazine for you']

can_make_note('i want to make this note', magazines)
# returns 2

can_make_note('zebra', magazines)
# returns -1


'''
from collections import Counter

def thisMagazineWorks(message, magazine):

    charMap = Counter(magazine.lower()) #case doesn't matter
    for char in message.lower(): #case doesn't matter
        if char == ' ': #not considering space  # l:32, ' ': 34
            continue
        if char not in charMap:
            return False
        if charMap[char] == 0:
            return False
        charMap[char] -= 1
    return True

def can_make_note(message, magazines):
    for i in range(len(magazines)):
        if thisMagazineWorks(message, magazines[i]):
            return i
    return -1



if __name__ == '__main__':
    magazines = ['this is magazine one', 'mag two', 'i want to make this new tiny magazine for you']

    print(can_make_note('I want to make this note', magazines))
    # returns 2

    print(can_make_note('zebra', magazines))
    # returns -1

# N is the total sumber of all letters (all magazines)
# Time:  O(N)
# Space: O(N)

