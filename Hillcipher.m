% data input
Universal_array = 'A':'Z';
Plain_text = input('Enter The Plaintext : ','s');
Key = input('Enter a 4 Alphabet Key : ','s');

% plaintext processing
index_of_spaces = find(Plain_text == ' ');
Plain_text(index_of_spaces) = [];
while mod(length(Plain_text),2) ~= 0
    Plain_text = [Plain_text 'X'];
end
indexes_Plain_text = [];
for n = 1:length(Plain_text)
    [col] = find(Universal_array == Plain_text(n));
    indexes_Plain_text = [indexes_Plain_text col];
end
Plain_text_matrix = reshape(indexes_Plain_text,2,[])';

% key processing
indexes_key = [];
for n = 1:length(Key)
    [col] = find(Universal_array == Key(n));
    indexes_key = [indexes_key col];
end
Key_matrix = reshape(indexes_key,2,2)';

% CONDITION CHECK
if det(Key_matrix) == 0
    fprintf('Invalid Key');
else
    multiplier = inversemodulo(det(Key_matrix),26);

    % CIPHERING
    cipher_matrix = Plain_text_matrix * Key_matrix;
    cipher_text = reshape(cipher_matrix',1,[]);
    for n = 1:length(cipher_text)
        cipher_text(n) = modu(cipher_text(n),26);
    end
    cipher_text = Universal_array(cipher_text);
    fprintf('Cipher text is --> %s\n',cipher_text);
end


