temp = regexp(fileread('input.txt'), '\r?\n', 'split');
data = vertcat(temp{:});

pharse = "MAS";
[rows, cols] = size(data);
count = 0;
for r = 1:rows
    for c = 1:cols
        numPharses = extract(data, r, c, pharse);
        count = count + numPharses;
    end
end

fprintf("Number of Appearances: %d\n", count);

function [numPharses] = extract(arr, r, c, pharse)
    numPharses = 0;

    [rows, cols] = size(arr);

    isVaild = true;
    sub1 = [];
    sub2 = [];
    for l = -1:1
        nc1 = c + l;
        nr1 = r + l;
        nc2 = c + -l;
        nr2 = r + l;
        if nr1 >= 1 && nr1 <= rows && nc1 >= 1 && nc1 <= cols
            sub1 = [sub1, arr(nr1, nc1)];
        else
            isVaild = false;
        end

        if nr2 >= 1 && nr2 <= rows && nc2 >= 1 && nc2 <= cols
            sub2 = [sub2, arr(nr2, nc2)];
        else
            isVaild = false;
        end
    end

    if ...
        isVaild && ...
        (sub1 == pharse || sub1 == reverse(pharse)) && ...
        (sub2 == pharse || sub2 == reverse(pharse))
        numPharses = numPharses + 1;
    end  
end