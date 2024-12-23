data = fileread('input.txt');

split = strsplit(data, "\n\n");
rules = splitlines(split(1));
order = splitlines(split(2));

map =  containers.Map('KeyType','double','ValueType','any');
isSet = false;
for i = 1:length(rules)
    num = sscanf(num2str(cell2mat(rules(i))), "%d|%d");

    if (isSet && map.isKey(num(1)))
        map(num(1)) = [map(num(1)), num(2)];
    else
        isSet  = true;
        map(num(1)) = [num(2)];
    end
end

count = 0;
for i = 1:length(order) 
    o = str2double(strsplit(num2str(cell2mat(order(i))), ','));
    hasUpdated = false;
    for j = length(o):-1:1
        for k = 1:j-1
            if map.isKey(o(j)) && ismember(o(k), map(o(j)))
                temp = o(j);
                o(j) = o(k);
                o(k) = temp;
                hasUpdated = true;
            end
        end
    end

    if ~hasUpdated
        if length(o) > 1
            count = count + o(ceil(end/2));
        end
    end
end

fprintf("Correct Middle Number Sum: %d\n", count);