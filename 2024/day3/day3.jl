# part 1
lines = read("day3/input.txt", String)
matches = eachmatch(r"mul\((\d*),(\d*)\)", lines)
println(reduce(+, map(m -> parse(Int, m[1]) * parse(Int, m[2]), collect(matches))))

# part 2
new_matches = collect(eachmatch(r"(mul\((\d*),(\d*)\))|(do\(\))|(don't\(\))", lines))

enable = true 
total = 0
for match in new_matches 
    if (match[1] !== nothing) && enable 
        x = parse(Int, match[2])
        y = parse(Int, match[3])
        global total 
        total += x * y
    elseif (match[4] !== nothing)
        global enable = true
    elseif (match[5] !== nothing)
        global enable = false
    end 
end 
println(total)


