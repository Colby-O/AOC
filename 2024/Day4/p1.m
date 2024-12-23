temp = regexp(fileread('input.txt'), '\r?\n', 'split');
data = vertcat(temp{:});

pharse = "XMAS";
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

    directions = [
        -1,  0;
         1,  0;
         0, -1;
         0,  1;
        -1, -1; 
        -1,  1;
         1, -1;
         1,  1
    ];

    [rows, cols] = size(arr);

    for d = 1:size(directions, 1)
        isVaild = true;
        subarray = arr(r, c);
        for l = 1:strlength(pharse)-1
            nc = c + l * directions (d, 1);
            nr = r + l * directions(d, 2);
            if nr >= 1 && nr <= rows && nc >= 1 && nc <= cols
                subarray = [subarray, arr(nr, nc)];
            else
                isVaild = false;
            end
        end
        
        if isVaild && subarray == pharse
            numPharses = numPharses + 1;
        end  
    end
end