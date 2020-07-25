function collatz(N, collatz_arr)
    n=int(N)
    while(True)
        if n < length(collatz_arr)
            #print("fasf")
            if collatz_arr[n]!=0:
                #print('JOL')
                return collatz_arr[n]
            end
        end
        if n%2==0:
            #print('SADDy')
            x=collatz(n/2,collatz_arr)+1
            if n<len(collatz_arr):
                collatz_arr[n]=x
            return x
        else:
            #print('HEssad')
            x=collatz(3*n+1,collatz_arr)+1
            if n<len(collatz_arr):
                collatz_arr[n]=x
            return x


def main():
    N = 1_000_000
    collatz_arr = [0] * N
    collatz_arr[1] = 1
    maxcollatz = n = 11
    maxn = 1

    for n in range(1, N):
        x = collatz(n, collatz_arr)
        if x > maxcollatz:
            maxcollatz = x
            maxn = n
    print("Number with largest collatz sequence: ",maxn)
    print("Sequence length: ",maxcollatz)
