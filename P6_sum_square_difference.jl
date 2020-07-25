function f(n)
    sumofsquares = n * (n + 1) * (2 * n + 1) / 6
    sumofnum= n * (n + 1) / 2
    return sumofnum ^ 2 - sumofsquares
end

println(f(100))
