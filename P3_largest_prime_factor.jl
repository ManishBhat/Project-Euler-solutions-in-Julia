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

ans = largest_prime_factor(600851475143)
println(ans)
