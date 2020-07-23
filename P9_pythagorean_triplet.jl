for a in 1:333
    for b in a+1:500
        c = 1000 - a - b
        if c^2 == a^2 + b^2
            println(a, " ",b, " ", c)
            println(a*b*c)
        end
    end
end
