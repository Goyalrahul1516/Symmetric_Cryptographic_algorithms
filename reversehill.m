% DATA INPUT
Universal_array = 'A':'Z';
Cipher_text = input('Enter The Cipher text : ','s');
Key = input('Enter a 4 Alphabet Key : ','s');

% key processing
indexes_of_key = [];
for n = 1:length(Key)
    [col] = find(Universal_array == Key(n));
    indexes_of_key = [indexes_of_key col];
end
key_matrix = reshape(indexes_of_key,2,2)';
multiplier = inversemodulo(det(key_matrix),26);
inverse_key_matrix = multiplier*adjoint(key_matrix);
inverse_key_matrix = modu(inverse_key_matrix,26)

% ciphertext processing
for n = 1:length(Cipher_text)
    indexes_Cipher_text(n) = find(Universal_array == Cipher_text(n));
end
Cipher_text_matrix = reshape(indexes_Cipher_text,2,[])';

% deciphering
Plain_text_matrix = Cipher_text_matrix * inverse_key_matrix;
Plain_text = reshape(Plain_text_matrix',1,[]);
for n = 1:length(Plain_text)
    Plain_text(n) = modu(Plain_text(n),26)
end
Plain_text = Universal_array(round(Plain_text))
fprintf('Plain text is --> %s\n',Plain_text);
