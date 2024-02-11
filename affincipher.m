Universal_array = ['A':'Z' 'a':'z'];
Plain_text = input('Enter Plain text : ', 's');
% Encrypting
Cipher_text = zeros(size(Plain_text));
a = input('Enter value of a ');
if (a>25 || a<1) || gcd(a,26) ~= 1
    fprintf('Error --> value of a is invalid')
else
    b = input('Enter value of b ');
    if b<0 || b>25
        fprintf('Error--> value of b is invalid')
    else
        for i=1:length(Plain_text)
            val = double(Plain_text(i));
            if val>=65 && val<=90
                Cipher_text(i) = Universal_array( mod(( (val-double('A')) * a ) + b, 26) + 1);
            elseif val>=97 && val<=122
                Cipher_text(i) = Universal_array( mod(( (val-double('a')) * a) + b, 26) + 27);
            else
                Cipher_text(i) = Plain_text(i);
            end
        end
        fprintf('Cipher text is --> %s\n',Cipher_text)
    end
end
