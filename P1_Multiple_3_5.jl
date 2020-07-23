function bruteforce()
    sum = 0
    for i in 1:999
        if i % 3 == 0 || i % 5 == 0
        	#print(i)
            sum = sum + i
        end
    end
    println(sum)
end

function analytical()
    sum = Int(3*333*334/2)
    sum += Int(5*199*200/2)
    sum -= Int(15*66*67/2)
    println(sum)
end

bruteforce()
analytical()
