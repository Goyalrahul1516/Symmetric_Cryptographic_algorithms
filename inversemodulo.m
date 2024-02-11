function inverse_modulo = inversemodulo(a,M)
i = 1;
F = true;
if a >= 1
    while(F)
        if mod(a*i,M) == 1 && a*i>M
            F = false;
        else
            i=i+1;
        end
        if i>M
            fprintf('error \n')
            break
        end
    end
    if i<=M
        inverse_modulo = i;
    end
elseif a < 0
    while(F)
        if mod(a*i,M) == 1 && a*i < -M
            F = false;
        else
            i=i+1;
        end
        if i>M
            fprintf('error \n')
            break
        end
    end
    if i<=M
        inverse_modulo = i;
    end
else
    fprintf('Error \n')
end
end