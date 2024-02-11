Universal_array = ['A':'Z' 'a':'z'];
Cipher_text = input('Enter Cipher text : ', 's');
RPlain_text = zeros(size(Cipher_text));
shift = 3;
for i=1:length(Cipher_text)
    val = double(Cipher_text(i));
    if val>=65 && val<=90
    RPlain_text(i) = Universal_array(mod(val-double('A')-shift,26)+1);
    elseif val>=97 && val<=122
    RPlain_text(i) = Universal_array(mod(val-double('a')-shift,26)+27);
    else
    RPlain_text(i) = Cipher_text(i);
    end
end
fprintf('Recovered Plain text is --> %s\n',RPlain_text)