data = sort(importdata("input.txt", " "));
totalDist = abs(data(:, 1).' - data(:, 2).');
fprintf('Total Distance: %d \n', sum(totalDist));