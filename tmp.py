from re import sub, match, I

def remove_chars1(s):
    print("remove_chars1:")
    ans = sub('[^a-z ]',"",s,I)
    print(s) # co_ol f0un%(c)t-io"n
    print(ans) # cool fun%(c)t-io"n
    return ans
def remove_chars1fixed(s):
    print("remove_chars1:")
    ans = sub('[^a-z ]',"",s,0,I)
    print(s) # co_ol f0un%(c)t-io"n
    print(ans) # cool fun%(c)t-io"n
    return ans

def remove_chars2(s):
    print("remove_chars2:")
    ans = str("".join(x for x in s if match('[a-z ]',x,I)))
    print(s) # co_ol f0un%(c)t-io"n
    print(ans) # cool function
    return ans

def remove_chars3(s):
    print("remove_chars3:")
    ans =  sub(r'[^a-zA-Z ]', '', s)
    print(s) # co_ol f0un%(c)t-io"n
    print(ans) # cool function
    return ans

s = 'co_ol f0un%(c)t-io"n'
remove_chars1(s)
print("Need to use keyworkds arguments.")
remove_chars1fixed(s)
remove_chars2(s)
remove_chars3(s)