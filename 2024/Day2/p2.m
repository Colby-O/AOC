data = importdata("input.txt", " ");

safeLevels = 0;

for i = 1:size(data, 1)
    levels = diff(data(i, :));
    isSafe = ...
        all(levels > 0 & abs(levels) <= 3 | isnan(levels)) | ...
        all(levels < 0 & abs(levels) <= 3 | isnan(levels));
    if (isSafe)
        safeLevels = safeLevels + 1;
        continue;
    end

    for j = 1:size(data, 2)
        res = data(i, [1:j-1, j+1:end]); 
        levels = diff(res, 1, 2);
        isSafe = ...
            all(levels > 0 & abs(levels) <= 3 | isnan(levels)) | ...
            all(levels < 0 & abs(levels) <= 3 | isnan(levels));
        if (isSafe)
            safeLevels = safeLevels + 1;
            break;
        end
    end
end

fprintf("Number of Safe Levels: %d\n", safeLevels);