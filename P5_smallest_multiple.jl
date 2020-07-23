function hcf(a, b)
    n1 = max(a,b)
    n2 = min(a,b)
    sqrt_n2 = sqrt(n2)
    ans = 1
    for i in 2:sqrt_n2
        if i > n2
            break
        end
        while n2 % i == 0
            n2 /= i
            if n1 % i == 0
                ans *= i
                n1 /= i
            end
        end
    end
    if n2 != 1 && n1 % n2 == 0
        ans *= n2
    end
    return ans
end

function lcm(a, b)
    return a * b / hcf(a,b)
end


function main()
    ans = big(1)
    for i in 2:20
        ans = lcm(ans, i)

    end
    println("Smallest multiple is ", floor(ans))
end

main()
