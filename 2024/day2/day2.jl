lines = map(x -> map(y -> parse(Int, y), split(x, " ")), readlines("day2/input1.txt"))

# part 1 
safe = reduce(+, map(report -> 
(reduce(&, map(level -> level[1] < level[2], zip(report, report[2:end]))) 
|| reduce(&, map(level -> level[1] > level[2], zip(report, report[2:end])))) 
&& reduce(&, map(level -> abs(level[1] - level[2]) >= 1 && abs(level[1] - level[2]) <= 3, zip(report, report[2:end]))) ? 1 : 0, lines))
println(safe)