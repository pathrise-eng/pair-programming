import math
import os
import random
import re
import sys

'''
Dutch Flag - https://docs.google.com/document/d/1Q_rMyFX5ZqBiuF4QHf18pYD1zvzfhCgKYcqS-6Cs51I/edit

You are given n balls. Each of these balls is of one the three colors: Red, Green and Blue. They are arranged randomly in a line. Your task is to rearrange them such that all balls of the same color are together and their collective color
groups are in this order: Red balls first, Green balls next and Blue balls last.

Input/Output Format For The Function:
Input Format:
An array of characters named balls, consisting of letters from {‘R’, ‘G’, ‘B’}, where each letter represents a ball with color.

'R' = Red Ball
'G' = Green Ball
'B' = Blue Ball

If balls = [G, B, G, G, R, B, R, G], then input should be:

Output Format:
[R, R, G, G, G, G, B, B]

Constraints:
Do this in ONE pass over the array - NOT TWO passes, just one pass.
Your solution can only use O(1) extra memory i.e. you have to do this in-place.

'R' = Red Ball
'G' = Green Ball
'B' = Blue Ball

balls = [G, B, G, G, R, B, R, G]

output should be: [R, R, G, G, G, G, B, B]
'''

def dutch_flag_sort(arr):
    r = 0
    g = 0
    b = len(arr) - 1
    i = 0
    while i <=  b:
        if arr[i] == 'R':
            arr[i],arr[r] = arr[r],arr[i]
            r += 1
            i += 1
        elif arr[i] == 'G':
            i += 1
        else:
            arr[i],arr[b] = arr[b],arr[i]
            b -= 1
    return arr

print(dutch_flag_sort(['G','B','G','G','R','B','R','G']))

if __name__ == '__main__':
    fptr = sys.stdout

    balls_count = int(input().strip())

    balls = []

    for _ in range(balls_count):
        balls_item = input()[0]
        balls.append(balls_item)

    dutch_flag_sort(balls)

    fptr.write('\n'.join(balls))
    fptr.write('\n')

    fptr.close()


