data = fileread("input.txt");
out = regexp ...
( ...
    data, ...
    "mul(\d\d?\d?\d?,\d\d?\d?\d?\)|do\(\)|don't\(\)", ...
    "match" ...
);
result = 0;
active = true;
for rawCmd = out
    cmd = num2str(cell2mat(rawCmd));
    if cmd == "do()"
        active = true;
    elseif cmd == "don't()"
        active = false;
    elseif active
        num = sscanf(cmd,'mul(%d,%d)');
        result = result + (num(1) * num(2));
    end
end
fprintf("Result: %d\n", result);