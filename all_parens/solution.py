
# Recursive 1

def generateParens(count):
    str = [None] * (count*2)
    result = []
    addParen(result,count,count,str,0)
    return result

def addParen(result, leftRem, rightRem, str, index):
    if (leftRem < 0 or rightRem < leftRem):
        return
    if (leftRem == 0 and rightRem == 0):
        result.append(''.join(str))
    else:
        str[index] = '('
        addParen(result,leftRem - 1,rightRem,str,index+1)
        str[index] = ')'
        addParen(result,leftRem,rightRem - 1,str,index+1)


# Recursive 2

def allParenetheses(count):
    getParentheses(count,0,0,'')

def getParentheses(integer, left, right, result):
    if left == integer and right == integer:
        print(result)
    if left < integer:
        getParentheses(integer, left + 1, right, result + '(')
    if right < integer and left > right:
        getParentheses(integer, left, right + 1, result + ')')

