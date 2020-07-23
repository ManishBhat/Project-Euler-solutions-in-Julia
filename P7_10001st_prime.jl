import Pkg
Pkg.add("prime_lib")
import prime_lib.esieve

function main()
    N = 1_50_000
    a, prime_list = esieve(N) # Sieve of eratostheneses
    println("The 10001st prime number is ", prime_list[10_001])
end

@time main()
