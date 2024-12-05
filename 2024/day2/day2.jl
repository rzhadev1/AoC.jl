lines = map(x -> map(y -> parse(Int, y), split(x, " ")), readlines("day2/input.txt"))

function is_safe(report)
    zipped = zip(report, report[2:end])
    cond1 = reduce(&, map(level -> level[1] < level[2], zipped)) 
    cond2 = reduce(&, map(level -> level[1] > level[2], zipped))
    cond3 = reduce(&, map(level -> abs(level[1] - level[2]) >= 1 && abs(level[1] - level[2]) <= 3, zipped))
    return (cond1 || cond2) && cond3 ? 1 : 0
end

function is_safe_dampen(report)
    for i in eachindex(report)
        rem_report = [report[1:i-1]; report[i+1:end]]
        if is_safe(rem_report) == 1
            return 1
        end
    end
    return 0 
end

# part 1 
println(reduce(+, map(report -> is_safe(report), lines)))
println(reduce(+, map(report -> is_safe_dampen(report), lines)))