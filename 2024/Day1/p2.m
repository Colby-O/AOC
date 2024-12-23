data = importdata("input.txt", " ");
occurrences = sum(bsxfun(@eq, data(:, 1), data(:, 2).'), 2);
similarity = sum(data(:, 1).' * occurrences)
fprintf("Similarity: %d", similarity);
