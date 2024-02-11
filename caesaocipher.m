Universal_array = ['A':'Z' 'a':'z'];
Plain_text = input('Enter Plain text : ', 's');
Cipher_text = zeros(size(Plain_text));
shift = 3;
for i=1:length(Plain_text)
    val = double(Plain_text(i));
    if val>=65 && val<=90
    Cipher_text(i) = Universal_array(mod(val-double('A')+shift,26)+1);
    elseif val>=97 && val<=122
    Cipher_text(i) = Universal_array(mod(val-double('a')+shift,26)+27);
    else
    Cipher_text(i) = Plain_text(i);
    end
end
fprintf('Cipher text is -->  %s\n',Cipher_text)