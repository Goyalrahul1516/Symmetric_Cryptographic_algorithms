% Data Input
Universal_Array = 'A':'Z';
Key_text = input('Enter The Key_text in capital only : ','s');
Original_plain_text = input('Enter the Plain_text in capital only : ','s');
Plain_text = Original_plain_text;

% Preprocessing Key and matrix creation
Key = setdiff(Key_text,' ','Stable');
Values_to_fill = setdiff(Universal_Array, Key);
if any(Key == 'I',"all") && any(Key == 'J',"all")
    Key = setdiff(Key,'J','Stable');
elseif any(Key == 'J',"all") && all(Key ~= 'I')
    Values_to_fill = setdiff(Values_to_fill,'I','Stable');
    flag = 1;
else
    Values_to_fill = setdiff(Values_to_fill,'J','Stable');
end
Final_Sequence = append(Key,Values_to_fill);
Playfair_Matix = reshape(Final_Sequence,[5,5])';

% Preprocessing Plain_text
index_of_spaces = find(Plain_text == ' ');
Plain_text(index_of_spaces) = [];
if mod(length(Plain_text),2) ~= 0
    Plain_text = [Plain_text 'X'];
end
if flag == 1
    number_of_Is = find(Plain_text=='I');
    Plain_text(number_of_Is) = 'J';
else
    number_of_Js = find(Plain_text=='J');
    Plain_text(number_of_Js) = 'I';
end
Plain_text = reshape(Plain_text,2,[])';
Iterations = size(Plain_text,1);
n=1;
while n <= Iterations
    if (Plain_text(n,1) == Plain_text(n,2))
        newRow = ['X',Plain_text(n,2)];
        Plain_text(n,2) = 'X';
        Iterations = Iterations + 1;
        part1 = Plain_text(1:n, :);
        part2 = Plain_text(n+1:end, :);
        Plain_text = [part1; newRow; part2];
    end
    n = n + 1;
end
Plain_text = reshape(Plain_text',1,[]);
Processed_Plain_text = Plain_text;

% Indexing of plaintext in Playfair matrix
Index_in_Playfair = [];
for n = 1:size(Plain_text,2)
    [Row, Column] = find(Playfair_Matix == Plain_text(n));
    Index_in_Playfair = [Index_in_Playfair; Row, Column];
end

% Ciphering
cipher_text = zeros(size(Plain_text,2),1);
cipher_text = char(cipher_text);
for n = 1:2:size(Plain_text,2)
    if Index_in_Playfair(n,1) == Index_in_Playfair(n+1,1) %same row
        cipher_text(n) = Playfair_Matix(Index_in_Playfair(n,1),selective_mudulo(Index_in_Playfair(n,2)+1,5));
        cipher_text(n+1) = Playfair_Matix(Index_in_Playfair(n+1,1),selective_mudulo(Index_in_Playfair(n+1,2)+1,5));
    elseif Index_in_Playfair(n,2) == Index_in_Playfair(n+1,2) %same column
        cipher_text(n) = Playfair_Matix(selective_mudulo(Index_in_Playfair(n,1)+1,5),Index_in_Playfair(n,2));
        cipher_text(n+1) = Playfair_Matix(selective_mudulo(Index_in_Playfair(n+1,1)+1,5),Index_in_Playfair(n+1,2));
    else
        cipher_text(n) = Playfair_Matix(Index_in_Playfair(n,1),Index_in_Playfair(n+1,2));
        cipher_text(n+1) = Playfair_Matix(Index_in_Playfair(n+1,1),Index_in_Playfair(n,2));
    end
end

% Ciphered text
cipher_text = reshape(cipher_text,1,[])
