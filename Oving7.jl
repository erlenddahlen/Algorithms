function can_use_greedy(coins)
    for i= 1:(length(coins)-1)
        a=coins[i]/coins[i+1]
        if !(round(a)%a==0)
            return false
        end
    end
    return true
end

function min_coins_greedy(coins, value)
    temp = value
    index = 1
    number = 0
    while temp > 0
        if temp>=coins[index]
            number = number + 1
            temp = temp - coins[index]
        else
            index = index +1
        end
    end
    return number
end

function min_coins_dynamic(coins,value)
    
end
