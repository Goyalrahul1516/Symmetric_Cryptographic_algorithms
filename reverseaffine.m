Universal_array = ['A':'Z' 'a':'z'];
Cipher_text = input('Enter Cipher text : ', 's');
Plain_text = zeros(size(Cipher_text));
a = input('Enter value of a ');
if (a>25 || a<1) || gcd(a,26) ~= 1
    fprintf('Error --> value of a is invalid')
else
    b = input('Enter value of b ');
    if b<0 || b>25
        fprintf('Error--> value of b is invalid')
    else
        k = inversemodulo(a,26);
        for i=1:length(Cipher_text)
            val = double(Cipher_text(i));
            if val>=65 && val<=90
                Plain_text(i) = Universal_array(mod(k*(val-b-65),26)+1);
            elseif val>=97 && val<=122
                Plain_text(i) = Universal_array(mod(k*(val-b-97),26)+27);
            else
                Plain_text(i) = Cipher_text(i);
            end
        end
        fprintf('Plain text is --> %s\n',Plain_text)
    end
end
