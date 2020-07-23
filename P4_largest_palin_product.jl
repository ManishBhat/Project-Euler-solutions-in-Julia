function ispalin(n)
    str = string(n)
    if str == reverse(str)
        return true
    end
    return false
end

function largest_palin_product()
    ans = 1
    for i in 100:999
        for j in 100:999
            if i*j>ans && ispalin(i*j)
                ans = i*j
            end
        end
    end
    return ans
end

println(largest_palin_product())
