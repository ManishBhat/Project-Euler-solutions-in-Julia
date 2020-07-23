function largest_prime_factor(n)
    sqrt_n = floor(sqrt(n))
    ans = 1
    for i in 2:sqrt_n
        if i > n
            break
        end
        while n % i == 0
            ans = i
            n /= i
        end
    end
    return ans
end

function esieve(N)
    """
    Function implements sieve of Eratosthenes (for all numbers uptil N).
    Returns array erat_sieve
    If erat_sieve[i] is True, then 2*i + 1 is a prime.
    """
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
