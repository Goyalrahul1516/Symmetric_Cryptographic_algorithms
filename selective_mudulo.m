function value = selective_mudulo(Number,modulus)
        if Number > modulus
            value = mod(Number,modulus);
        elseif Number == 0
            value = modulus;
        else
            value = Number;
        end
end