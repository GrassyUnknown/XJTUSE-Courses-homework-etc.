def MaxFactor(p,q):
    if p<q:
        r=q
        q=p
        p=r
    r=p%q
    while(r!=0):
        p=q
        q=r
        r=p%q
    return q
p=int(input())
q=int(input())
print(MaxFactor(p,q))
