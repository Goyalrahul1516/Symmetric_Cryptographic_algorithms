% Data Input
Universal_Array = 'A':'Z';
Key_text = input('Enter The Key_text in capital only : ','s');
Cipher_text = input('Enter the Cipher_text in capital only : ','s');

% Preprocessing Key and matrix creation
Key = setdiff(Key_text,' ','Stable');
Values_to_fill = setdiff(Universal_Array, Key);
if any(Key == 'I',"all") && any(Key == 'J',"all")
    Key = setdiff(Key,'J','Stable');
elseif any(Key == 'J',"all") && all(Key ~= 'I')
    Values_to_fill = setdiff(Values_to_fill,'I','Stable');
else
    Values_to_fill = setdiff(Values_to_fill,'J','Stable');
end
Final_Sequence = append(Key,Values_to_fill);
Playfair_Matix = reshape(Final_Sequence,[5,5])';
index_of_spaces = find(Cipher_text == ' ');
Cipher_text(index_of_spaces) = [];

% Indexing of plaintext in Playfair matrix
Index_in_Playfair = [];
for n = 1:size(Cipher_text,2)
    [Row, Column] = find(Playfair_Matix == Cipher_text(n));
    Index_in_Playfair = [Index_in_Playfair; Row, Column];
end

% Ciphering
Plain_text = zeros(size(Cipher_text,2),1);
Plain_text = char(Plain_text);
for n = 1:2:size(Cipher_text,2)
    if Index_in_Playfair(n,1) == Index_in_Playfair(n+1,1) %same row
        Plain_text(n) = Playfair_Matix(Index_in_Playfair(n,1),selective_mudulo(Index_in_Playfair(n,2)-1,5));
        Plain_text(n+1) = Playfair_Matix(Index_in_Playfair(n+1,1),selective_mudulo(Index_in_Playfair(n+1,2)-1,5));
    elseif Index_in_Playfair(n,2) == Index_in_Playfair(n+1,2) %same column
        Plain_text(n) = Playfair_Matix(selective_mudulo(Index_in_Playfair(n,1)-1,5),Index_in_Playfair(n,2));
        Plain_text(n+1) = Playfair_Matix(selective_mudulo(Index_in_Playfair(n+1,1)-1,5),Index_in_Playfair(n+1,2));
    else
        Plain_text(n) = Playfair_Matix(Index_in_Playfair(n,1),Index_in_Playfair(n+1,2));
        Plain_text(n+1) = Playfair_Matix(Index_in_Playfair(n+1,1),Index_in_Playfair(n,2));
    end
end
Preprocessed_Plain_text = Plain_text';
Iterations = length(Plain_text);
n=4;
while n <= Iterations
    if (Plain_text(n-2) == Plain_text(n-1)) && (Plain_text(n-1) == 'X') && (Plain_text(n) == Plain_text(n-3))
        Plain_text(n-2) = [];
        Plain_text(n-2) = [];
        Iterations = Iterations - 2;
    end
    n = n + 1;
end
for n = 1:length(index_of_spaces)
    Plain_text = [Plain_text(1:index_of_spaces(n)-1, :); ' ' ; Plain_text(index_of_spaces(n):end, :)];
end

% Ciphered text
Plain_text = reshape(Plain_text,1,[])
