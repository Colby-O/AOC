data = fileread("input.txt");
out = regexp(data, "mul(\d\d?\d?\d?,\d\d?\d?\d?\)", "match");
result = 0;
for cmd = out
    num = sscanf(num2str(cell2mat(cmd)),'mul(%d,%d)');
    result = result + (num(1) * num(2));
end
fprintf("Result: %d\n", result);