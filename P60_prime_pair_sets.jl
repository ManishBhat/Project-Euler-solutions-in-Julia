import Primes

function esieve(N)
    #=
    Function implements sieve of Eratosthenes (for all numbers uptil N).
    Returns array erat_sieve
    If erat_sieve[i] is True, then 2*i + 1 is a prime.
    =#
    a = fill(true, floor(Int, N/2))
    upper_lim = ceil(Int,(sqrt(N) - 1) / 2)
    for i in 1:upper_lim
        if a[i] == true
            j = i + (2*i+1)
            while j <= length(a)
                a[j] = false
                j += (2*i+1)
            end
        end
    end
    prime_list = Vector{Int64}()
    push!(prime_list, 2)

    for i in 1:length(a)
        if a[i] == true
            push!(prime_list, 2*i+1)
        end
    end
    return a, prime_list
end


function is_prime(x, erat_sieve, prime_cache)
    #=
    Parameters
    ----------
    x : int
        We are testing if x is prime
    erat_sieve : array of Bools
        This sieve tells us if number is prime or not
    prime_cache : dict with integer "key" and Bool "value"
        This cache is there so that we don't have to repeatedly do prime test.

    Returns
    -------
    TYPE: Bool
        If number is prime, returns True else False.

    =#
    if x == 2
        return true
    end

    if x % 2 == 0
        return false
    end

    if x < length(erat_sieve)
        if erat_sieve[floor(Int,(x-1)/2)] == true
            return true
        else
            return false
        end
    else
        prime_cache[x] = get(prime_cache, x, Primes.isprime(x))
        return prime_cache[x]
    end
end


function is_primepair(a, b, erat_sieve, prime_cache, pair_cache)
    if haskey(pair_cache, (a,b))
        return pair_cache[(a,b)]
    end
    c1 = parse(Int64, string(string(a),string(b)))
    c2 = parse(Int64, string(string(b),string(a)))
    if is_prime(c1, erat_sieve, prime_cache)
        if is_prime(c2, erat_sieve, prime_cache)
            pair_cache[(a,b)] = true
            return true
        end
    end
    pair_cache[(a,b)] = false
    return false
end


function main()
    N = 10_000_000
    #N = 100
    erat_sieve, _ = esieve(N)
    N = 20_000
    _, prime_list = esieve(N)
    filter!(x->x≠2,prime_list) # deleting 2
    filter!(x->x≠5,prime_list) # deleting 5
    prime_cache = Dict()
    pair_cache = Dict()

    for i in 1:length(prime_list)
        a1 = prime_list[i]
        for j in i+1:length(prime_list)
            a2 = prime_list[j]
            if is_primepair(a1, a2, erat_sieve, prime_cache, pair_cache)
                for k in j+1:length(prime_list)
                    a3 = prime_list[k]
                    if is_primepair(a1, a3, erat_sieve, prime_cache, pair_cache) && is_primepair(a2, a3, erat_sieve, prime_cache, pair_cache)
                        for m in k+1:length(prime_list)
                            a4 = prime_list[m]
                            if is_primepair(a1, a4, erat_sieve, prime_cache, pair_cache) && is_primepair(a2, a4, erat_sieve, prime_cache, pair_cache) && is_primepair(a3, a4, erat_sieve, prime_cache, pair_cache)
                                for p in m+1:length(prime_list)
                                    a5 = prime_list[p]
                                    if is_primepair(a1, a5, erat_sieve, prime_cache, pair_cache) && is_primepair(a2, a5, erat_sieve, prime_cache, pair_cache) && is_primepair(a3, a5, erat_sieve, prime_cache, pair_cache) && is_primepair(a4, a5, erat_sieve, prime_cache, pair_cache)
                                        println(a1,"+",a2,"+",a3,"+",a4,"+",a5," = ",a1+a2+a3+a4+a5)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

#=
if __name__ == "__main__":
    start_time = time.time()
    main()
    print("Time taken (in s): ", time.time() - start_time)


def test_is_prime():
    N = 10_000_000
    #N = 100
    a, prime_list = sieve_of_erat(N)
    x = 20_011
    print(f"{x} is prime: {is_prime(x, a)}")
=#
@time main()
