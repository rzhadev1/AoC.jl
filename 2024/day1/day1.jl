lines = readlines("2024/day1/input.txt")
a = sort(map(x -> parse(Int, split(x, " ")[1]), lines))
b = sort(map(x -> parse(Int, split(x, " ")[4]), lines))
println(reduce(+, map(x -> abs(x[1] - x[2]), zip(a, b))))