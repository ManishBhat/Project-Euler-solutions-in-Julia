function fibonacci_sum()
    t1 = 1
    t2 = 2
    sum = 0
    while t2 < 4_000_000
        if t2 % 2 == 0
            sum += t2
        end
        temp_t2 = t2 + t1
        t1 = t2
        t2 = temp_t2
    end
    print("Sum is : ")
    println(sum)
end

fibonacci_sum()
