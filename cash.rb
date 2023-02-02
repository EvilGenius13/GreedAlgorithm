def round(amount)
    amount = amount.to_f
    amount = (amount * 20).round / 20.0 
    amount = amount * 100
    amount = amount.to_i
    return amount
end

def change(amount)
    amount = round(amount)

    values = {
        :toonie => 200,
        :loonie => 100,
        :quarter => 25,
        :dime => 10,
        :nickel => 5,
    }
    coins = {
        :toonie => 0,
        :loonie => 0,
        :quarter => 0,
        :dime => 0,
        :nickel => 0,
    }
    remaining = amount
    total_coins = 0
    for coin in values.keys
        while remaining >= values[coin]
            if remaining >= values[coin]
                coins[coin] += 1
                total_coins += 1
                remaining -= values[coin]
            end
        end
    end

    if total_coins == 0
        final_message = "You don't need to dispense any change."
    else 
        final_message = "You need to dispense: "
        for coin in coins.keys
            if coins[coin] > 0
                final_message += coins[coin] > 1 ? "#{coins[coin]} #{coin}s" : "#{coins[coin]} #{coin}"
                total_coins -= coins[coin]
                final_message += total_coins > 0 ? ', ' : '.'
            end
        end
        final_message = final_message.split(" ")
        if final_message.length > 6
            final_message.insert(-3, 'and')
        end
        final_message = final_message.join(" ")
    end
    puts final_message
end
change(2.25)
change(1.82)
change(12.94)
change(1.00)
change(0.02)
